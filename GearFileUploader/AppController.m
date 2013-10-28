//
//  AppController.m
//  GearFileUploader
//
//  Created by Rahul Budhiraja - Intern on 10/26/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import "AppController.h"

@implementation AppController


- (IBAction)saySomething:(id)sender
{
    [label setStringValue:@"Helllo"];
}

-(IBAction)selectPhotos:(id)sender
{

    //-----------------
    //NSOpenPanel: Displaying a File Open Dialog in OS X 10.7
    //-----------------

        // Loop counter.
        int i;
        
        // Create a File Open Dialog class.
        NSOpenPanel* openDlg = [NSOpenPanel openPanel];
        
        // Set array of file types
        NSArray *fileTypesArray;
        fileTypesArray = [NSArray arrayWithObjects:@"jpg", @"gif", @"png", nil];
        
        // Enable options in the dialog.
        [openDlg setCanChooseFiles:YES];
        [openDlg setAllowedFileTypes:fileTypesArray];
        [openDlg setAllowsMultipleSelection:TRUE];
        
        // Display the dialog box.  If the OK pressed,
        // process the files.
    
        i=0;
    
        if ( [openDlg runModal] == NSOKButton ) {
            
            // Gets list of all files selected
           filesToPush = [openDlg URLs];
            
            // Loop through the files and process them.
            for( i = 0; i < [filesToPush count]; i++ ) {
                
                // Do something with the filename.
                NSLog(@"File path: %@", [[filesToPush objectAtIndex:i] path]);
                
            }
            
        }
        
    
}

-(IBAction)selectPath:(id)sender
{
    
    // Create a File Open Dialog class.
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    

    
    // Enable the selection of directories in the dialog.
    [openDlg setCanChooseDirectories:YES];
     [openDlg setCanChooseFiles:NO];

    
    // Display the dialog box.  If the OK pressed,
    // process the files.
    if ( [openDlg runModal] == NSOKButton ) {

        NSURL *myPath = [[openDlg URLs]objectAtIndex:0];
        NSLog (@"%@", myPath);
        
        
        pathtoAdb=[myPath absoluteString];
       
        
        actualPathtoAdb=[NSString stringWithFormat:@"%@platform-tools/adb",pathtoAdb ];
        
       actualPathtoAdb = [actualPathtoAdb substringFromIndex:16];
        
        NSLog (@"%@", actualPathtoAdb);
                                    
        
     
        
        NSLog (@" Actual path to adb %@", actualPathtoAdb);
        
        
        NSFileManager *filemgr;
        filemgr = [NSFileManager defaultManager];
        
       
        contents = [filemgr contentsOfDirectoryAtURL:myPath
                          includingPropertiesForKeys:[NSArray array]
                                             options:(NSDirectoryEnumerationSkipsHiddenFiles)
                                               error:nil];
        
        numFiles=0;
        
        for( int i = 0; i < [contents count]; i++ ) {
            
            // Do something with the filename.
            NSLog(@"File path: %@", [[contents objectAtIndex:i] path]);
            NSString *path=[contents objectAtIndex:i];

            [self examineContentsofChosenDirectory :path.lastPathComponent];
            
        }
    }
    


    
    if(numFiles>0)
    {
     [self pushFiles ];
    }
    
}

-(void)pushFiles

{

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:actualPathtoAdb];
    [task setArguments:[NSArray arrayWithObjects: @"devices", nil]];
 
   
    
    
    // ADB push <path> /mnt/sdcard/DCIM/Camera/
    
    for( int i = 0; i < [filesToPush count]; i++ ) {
        
        // Do something with the filename.
        NSLog(@"File path: %@", [[filesToPush objectAtIndex:i] path]);
        NSString *path=[filesToPush objectAtIndex:i];
        
        [task setArguments:([NSArray arrayWithObjects:@"push", path,@"/mnt/sdcard/DCIM/Camera/",nil])];
         [task launch];
    }

    
  
    
    
    // ADB install <apk>
    
/* use the info taken from this thread     http://stackoverflow.com/questions/6109234/how-to-run-not-only-install-an-android-application-using-apk-file */
    
    // ADB start  ...
    
    
    
    
    
}




-(void) examineContentsofChosenDirectory:(NSString *) aString
{
    
    NSArray* alphaArray = [NSArray arrayWithObjects: @"add-ons", @"build-tools", @"docs",@"extras", @"platform-tools", @"sources", @"temp", @"tools",@"samples",nil];
    
    BOOL found = NO;
    
    
     NSLog(@"-->%@<--", aString);
  
    if ( [alphaArray containsObject:aString] ) {
        NSLog(@"Yes there is %@", alphaArray);
        
        found=YES;
        numFiles++;
        // do found
    } else {
        // do not found
        NSLog(@"No there is %@", alphaArray);
    }
    
    
    NSLog(@"File count: %d", numFiles);
    
    
}


@end

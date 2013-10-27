//
//  AppController.m
//  GearFileUploader
//
//  Created by Rahul Buddhiraja - Intern on 10/26/13.
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
        if ( [openDlg runModal] == NSOKButton ) {
            
            // Gets list of all files selected
            NSArray *files = [openDlg URLs];
            
            // Loop through the files and process them.
            for( i = 0; i < [files count]; i++ ) {
                
                // Do something with the filename.
                NSLog(@"File path: %@", [[files objectAtIndex:i] path]);
                
            }
            
        }
        
    
}

-(IBAction)selectPath:(id)sender
{
    int i;
    
    // Create a File Open Dialog class.
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    

    
    // Enable the selection of directories in the dialog.
    [openDlg setCanChooseDirectories:YES];
     [openDlg setCanChooseFiles:NO];

    
    // Display the dialog box.  If the OK pressed,
    // process the files.
    if ( [openDlg runModal] == NSOKButton ) {
        
//        NSArray *files = [openDlg URLs];
//        NSString *filepath =
        NSURL *myPath = [[openDlg URLs]objectAtIndex:0];
        NSLog (@"%@", myPath);
        
        NSFileManager *filemgr;
        filemgr = [NSFileManager defaultManager];
        
        NSArray *contents;
        contents = [filemgr contentsOfDirectoryAtURL:myPath
                          includingPropertiesForKeys:[NSArray array]
                                             options:(NSDirectoryEnumerationSkipsHiddenFiles)
                                               error:nil];
        
        for( i = 0; i < [contents count]; i++ ) {
            
            // Do something with the filename.
            NSLog(@"File path: %@", [[contents objectAtIndex:i] path]);
            NSString *path=[contents objectAtIndex:i];
            
            [self examineContentsofChosenDirectory :path];
            
        }
    }

    
    
}

-(void) examineContentsofChosenDirectory:(NSString *) aString
{
    
    NSArray* alphaArray = [NSArray arrayWithObjects: @"add-ons", @"build-tools", @"docs",@"extras", @"platform-tools", @"sources", @"temp", @"tools",@"samples",nil];
    
    BOOL found = NO;
    NSInteger i=0;
    if ( [alphaArray containsObject: aString] ) {
        NSLog(@"Yes there is %@", alphaArray);

        
        // do found
    } else {
        // do not found
        NSLog(@"No there is %@", alphaArray);
    }
    
    
    NSLog(@"File count: %d", 0);
    
    
}


@end

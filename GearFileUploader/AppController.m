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
        
        // Gets list of all files selected
        NSArray *files = [openDlg URLs];
        
        // Loop through the files and process them.
        for( i = 0; i < [files count]; i++ ) {
            
            // Do something with the filename.
            NSLog(@"File path: %@", [[files objectAtIndex:i] path]);
            
            
            
            
        }
        
    }

    
    
}



@end

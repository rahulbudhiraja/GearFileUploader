//
//  AppController.h
//  GearFileUploader
//
//  Created by Rahul Buddhiraja - Intern on 10/26/13.
//  Copyright (c) 2013 Rahul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
{
    
    @private
    
    IBOutlet NSTextField *label;
    
    NSInteger *numFiles;
    NSString *pathtoAdb;
    NSString *actualPathtoAdb;
    
    NSArray *filesToPush;
    NSArray *contents;
    
}


- (IBAction)saySomething:(id)sender;

// Interface Builder Action : function name :(identifier of parameter 1) variable


- (IBAction)selectPhotos:(id)sender;

- (IBAction)selectPath:(id)sender;

- (void) examineContentsofChosenDirectory:(NSString *) aString;

- (void) pushFiles;



@end

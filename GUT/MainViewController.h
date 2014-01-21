//
//  MainViewController.h
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController

-(IBAction)addFolderWithGit:(id)sender;

-(IBAction)addFilesToGit:(id)sender;
-(IBAction)removeFilesFromGit:(id)sender;
-(IBAction)commitChangesToGit:(id)sender;
-(IBAction)pushToRemoteGit:(id)sender;
-(IBAction)revertFileFromGit:(id)sender;
-(IBAction)pullFromRemoteGit:(id)sender;

@end

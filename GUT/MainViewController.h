//
//  MainViewController.h
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController

@property(nonatomic,weak)IBOutlet NSTableView *gutTableView;
-(IBAction)addFolderWithGit:(id)sender;

@end
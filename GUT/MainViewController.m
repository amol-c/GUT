//
//  MainViewController.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "MainViewController.h"
#import "GUTTerminalStrategyFactory.h"
#import "GUTTerminalContext.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 5;
}


- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    if( [tableColumn.identifier isEqualToString:@"GUTProjects"] )
    {
        cellView.textField.stringValue = @"Test";
        return cellView;
    }
    return cellView;

}


-(IBAction)addFolderWithGit:(id)sender{
    NSSegmentedControl *control = (NSSegmentedControl*)sender;
    
    if(control.selectedSegment==0){ //Add
        NSLog(@"%ld",(long)control.selectedSegment);
        
        GUTTerminalContext *context = [GUTTerminalStrategyFactory createVerifyFolderContext];
         NSString *output = [context execute];
    }else{ //Remove
        NSLog(@"%ld",(long)control.selectedSegment);

    };
}

@end

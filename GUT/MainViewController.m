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
#import "GUTHelperDelegate.h"
#import "GUTHelperConcreteDelegate.h"
#import "FileSystemItem.h"
#import "NSOutlineView+SelectedItems.h"


@interface MainViewController ()
@property(strong)id <GUTHelperDelegate> helperDelegate;

@property(nonatomic,weak)IBOutlet NSOutlineView *gutSidebarExplorer;
@property(nonatomic)IBOutlet NSTextView *consoleTextView;

@property(nonatomic)NSMutableArray *outlineDataSource;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        _helperDelegate=[[GUTHelperConcreteDelegate alloc]init];
        _outlineDataSource=[[NSMutableArray alloc]init];
    }
    return self;
}



#pragma NSOutlineViewDelegate

// Data Source methods

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    
    if (item == nil) {
        return [_outlineDataSource count];
    }else{
        return [item numberOfChildren];
    }
}


- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    
    if (item == nil) {
        return YES;
    }else{
        BOOL hasChildrens = ([item numberOfChildren] != -1);
        return hasChildrens;
    }
}


- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
  
    if (item == nil) {
        FileSystemItem *rootItem = [_outlineDataSource objectAtIndex:index];
        return rootItem;
    }else{
        FileSystemItem *child =[(FileSystemItem *)item childAtIndex:index];
        return child;
    }
}


- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    if (item == nil) {
        return @"/";
    }else{
        NSString *relativePath = [[[item relativePath] lastPathComponent] copy];
        return relativePath;
    }
}


-(IBAction)addFilesToGit:(id)sender{
    
    NSArray *selectedItems = [_gutSidebarExplorer selectedItems];
    if ([selectedItems count]) {
        FileSystemItem *rootItem = [selectedItems objectAtIndex:0];
        rootItem = [rootItem rootItem];
        
        NSMutableString *allPaths = [[NSMutableString alloc]init];
        [allPaths appendString:[[rootItem fullPath] stringByAppendingString:@" "]];
        
    for (FileSystemItem *singleItem in selectedItems) {
        NSString *fullSinglePath = [singleItem fullPath];
        [allPaths appendString:[fullSinglePath stringByAppendingString:@" "]];
    }
    
    GUTTerminalContext *context = [GUTTerminalStrategyFactory createAddContext];
    
    NSString *output = [context execute:[NSArray arrayWithObject:allPaths]];
    NSString *formattedOutput=[_helperDelegate formatGitOutputConsoleForString:output];
    [_consoleTextView insertText:formattedOutput];
        
    }

}
-(IBAction)removeFilesFromGit:(id)sender{
    
}
-(IBAction)commitChangesToGit:(id)sender{
    
    GUTTerminalContext *context = [GUTTerminalStrategyFactory createCommitContext];
    
    NSString *pathToRepo = [[_outlineDataSource objectAtIndex:0]relativePath];
    NSString *output = [context execute:[[NSArray alloc]initWithObjects:pathToRepo,@"This is my commit message", nil]];
    NSString *formattedOutput=[_helperDelegate formatGitOutputConsoleForString:output];
    [_consoleTextView insertText:formattedOutput];
}
-(IBAction)pushToRemoteGit:(id)sender{
    
}
-(IBAction)revertFileFromGit:(id)sender{
    
}
-(IBAction)pullFromRemoteGit:(id)sender{
    
}


-(IBAction)addFolderWithGit:(id)sender{
    NSSegmentedControl *control = (NSSegmentedControl*)sender;
    
    if(control.selectedSegment==0){ //Add
        NSLog(@"%ld",(long)control.selectedSegment);
        [self checkToAddDataToDatasource];

    }else{ //Remove
        NSLog(@"%ld",(long)control.selectedSegment);
    };
}



- (void)checkToAddDataToDatasource {
    GUTTerminalContext *context = [GUTTerminalStrategyFactory createVerifyFolderContext];
    
    [_helperDelegate openDocumentWindow:^(NSString *urlName,NSArray *urlArray) {
        NSString *output = [context execute:[[NSArray alloc]initWithObjects:urlName, nil]];
        if ([output isEqualToString:@""]) {
            [_helperDelegate alertWithMessage:@"This is not a GIT repository"];
        }else{
            NSString *outputUrl = [output stringByAppendingString:@"/"];
            [self updateDataWithUrlName:outputUrl];
        }
        
    }];
}

-(void)updateDataWithUrlName:(NSString*)urlName{
    if ([_outlineDataSource count] == 0) { //Insert data if count is zero. regardless of anything
        [self insertDataWithUrlName:urlName];
    }else{
        
        BOOL isDataAdded=NO;
        for (FileSystemItem *item in _outlineDataSource) { //Check if the path is already added
            if ([item.relativePath isEqualToString:urlName]) {//If path is not added, then insert in our dataModel
                [_helperDelegate alertWithMessage:@"Repository already added"];
                isDataAdded=YES;
                break;
             
            }
        }
        
        if (!isDataAdded) {
            [self insertDataWithUrlName:urlName];
        }

    }
}


-(void)insertDataWithUrlName:(NSString*)urlName{
    FileSystemItem *item = [[FileSystemItem alloc]initWithPath:urlName];
    [_outlineDataSource addObject:item];
    [_gutSidebarExplorer reloadData];
}

@end

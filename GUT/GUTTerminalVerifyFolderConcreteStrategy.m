//
//  GUTTerminalConcreteStrategy.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalVerifyFolderConcreteStrategy.h"
#import <SecurityFoundation/SFAuthorization.h>
#import "GUTHelperConcreteDelegate.h"
#import "GUTHelperDelegate.h"

@implementation GUTTerminalVerifyFolderConcreteStrategy


- (NSString*) execute:(NSArray *)arg{
    
    NSString *gitProjectPath = [arg objectAtIndex:0];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShellScripts/FolderTestScript" ofType:@"sh"];
    NSString *cmdToRun = [NSString stringWithFormat:@"%@ %@",path,gitProjectPath];
    
    id<GUTHelperDelegate> helperDelegate = [[GUTHelperConcreteDelegate alloc]init];
    NSString *output= [helperDelegate runCommand:cmdToRun];

    return output;
    // return @"echo \"$(git rev-parse --show-toplevel)\"";
}





@end

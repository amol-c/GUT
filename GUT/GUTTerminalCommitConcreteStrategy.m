//
//  GUTTerminalCommit.m
//  GUT
//
//  Created by Amol Chaudhari on 1/20/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalCommitConcreteStrategy.h"
#import "GUTHelperDelegate.h"
#import "GUTHelperConcreteDelegate.h"

@implementation GUTTerminalCommitConcreteStrategy

- (NSString*) execute:(NSArray *)arg{
    
    NSString *gitProjectPath = [arg objectAtIndex:0];
    NSString *commitMessage = [arg objectAtIndex:1];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShellScripts/Commit" ofType:@"sh"];
    //e.g //Commit.sh /Users/Documents/xcode_projects/GUT "commit Message"
    NSString *commandToRun =[NSString stringWithFormat:@"%@ %@ %@",path,gitProjectPath,commitMessage];
    id<GUTHelperDelegate> helperDelegate = [[GUTHelperConcreteDelegate alloc]init];
    NSString *output= [helperDelegate runCommand:commandToRun];

    return output;
}

@end

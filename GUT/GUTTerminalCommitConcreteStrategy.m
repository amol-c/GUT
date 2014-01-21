//
//  GUTTerminalCommit.m
//  GUT
//
//  Created by Amol Chaudhari on 1/20/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalCommitConcreteStrategy.h"

@implementation GUTTerminalCommitConcreteStrategy

- (NSString*) execute:(NSArray *)arg{
    
    NSString *gitProjectPath = [arg objectAtIndex:0];
    NSString *commitMessage = [arg objectAtIndex:1];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShellScripts/Commit" ofType:@"sh"];
    //return [NSString stringWithFormat:@"%@ %@",@"chmod 755 ",path];

    //Commit.sh /Users/Documents/xcode_projects/GUT "commit Message"
    return [NSString stringWithFormat:@"%@ %@ %@",path,gitProjectPath,commitMessage];
}

@end

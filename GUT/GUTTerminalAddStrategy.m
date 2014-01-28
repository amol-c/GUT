//
//  GUTTerminalAddStrategy.m
//  GUT
//
//  Created by Amol Chaudhari on 1/21/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalAddStrategy.h"
#import "GUTHelperConcreteDelegate.h"



@implementation GUTTerminalAddStrategy

- (NSString*) execute:(NSArray *)arg{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShellScripts/Add" ofType:@"sh"];
    NSString *allPaths=[arg objectAtIndex:0];
    //e.g //Commit.sh /Users/Documents/xcode_projects/GUT "commit Message"
    NSString *commandToRun =[NSString stringWithFormat:@"%@ %@",path,allPaths];

    
    id<GUTHelperDelegate> helperDelegate = [[GUTHelperConcreteDelegate alloc]init];
    NSString *consoleOutput = [helperDelegate runCommand:commandToRun];
    
    return consoleOutput;
}

@end

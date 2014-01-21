//
//  GUTTerminalConcreteStrategy.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalVerifyFolderConcreteStrategy.h"
#import <SecurityFoundation/SFAuthorization.h>


@implementation GUTTerminalVerifyFolderConcreteStrategy


- (NSString*) execute:(NSArray *)arg{
    
    NSString *gitProjectPath = [arg objectAtIndex:0];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShellScripts/FolderTestScript" ofType:@"sh"];
    
    //return [NSString stringWithFormat:@"%@ %@",@"chmod 755 ",path];
    return [NSString stringWithFormat:@"%@ %@",path,gitProjectPath];
    // return @"echo \"$(git rev-parse --show-toplevel)\"";
}





@end

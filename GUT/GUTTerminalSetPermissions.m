//
//  GUTTerminalSetPermissions.m
//  GUT
//
//  Created by Amol Chaudhari on 1/21/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalSetPermissions.h"
#import "GUTHelperDelegate.h"
#import "GUTHelperConcreteDelegate.h"

@implementation GUTTerminalSetPermissions

- (NSString*) execute:(NSArray *)arg{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShellScripts/" ofType:@""];
    NSArray *pathsArray = [[NSBundle mainBundle]pathsForResourcesOfType:@"sh" inDirectory:@"ShellScripts"];
    

    NSString *output = [self runCommandsFromArray:pathsArray];
    
    return output;
}


-(NSString*)runCommandsFromArray:(NSArray*)pathsArray{
    
    
    id<GUTHelperDelegate> helperDelegate = [[GUTHelperConcreteDelegate alloc]init];
    
    NSMutableString *outputString = [[NSMutableString alloc]init];
    for (NSString *singlePath in pathsArray) {
            NSString *eachCmd = [NSString stringWithFormat:@"%@ %@",@"chmod 755 ",singlePath];
            NSString *cmdOutput = [helperDelegate runCommand:eachCmd];
            [outputString appendString:cmdOutput];
    }

    return outputString;
}


@end

//
//  GUTTerminalConcreteStrategy.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalVerifyFolderConcreteStrategy.h"

@implementation GUTTerminalVerifyFolderConcreteStrategy


- (NSString*) execute{
    return @"echo \"$(git rev-parse --show-toplevel)\"";
}


@end

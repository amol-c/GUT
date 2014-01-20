//
//  GUTTerminalStrategyFactory.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalStrategyFactory.h"
#import "GUTTerminalVerifyFolderConcreteStrategy.h"
@implementation GUTTerminalStrategyFactory

+(GUTTerminalContext*)createVerifyFolderContext{
    
    GUTTerminalVerifyFolderConcreteStrategy *strategy = [[GUTTerminalVerifyFolderConcreteStrategy alloc]init];
    GUTTerminalContext *context = [[GUTTerminalContext alloc]init];
    
    [context setStrategy:strategy];
    
    return context;
}

@end

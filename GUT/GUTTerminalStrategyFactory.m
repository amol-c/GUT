//
//  GUTTerminalStrategyFactory.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalStrategyFactory.h"
#import "GUTTerminalVerifyFolderConcreteStrategy.h"
#import "GUTTerminalCommitConcreteStrategy.h"
#import "GUTTerminalSetPermissions.h"
#import "GUTTerminalAddStrategy.h"

@implementation GUTTerminalStrategyFactory

+(GUTTerminalContext*)createVerifyFolderContext{
    
    id<GUTTerminalStrategy> strategy = [[GUTTerminalVerifyFolderConcreteStrategy alloc]init];
    GUTTerminalContext *context = [[GUTTerminalContext alloc]init];
    
    [context setStrategy:strategy];
    return context;
}

+(GUTTerminalContext*)createAddContext{
    id<GUTTerminalStrategy> strategy = [[GUTTerminalAddStrategy alloc]init];
    GUTTerminalContext *context = [[GUTTerminalContext alloc]init];
    
    [context setStrategy:strategy];
    return context;

}

+(GUTTerminalContext*)createCommitContext{
    
    id<GUTTerminalStrategy> strategy = [[GUTTerminalCommitConcreteStrategy alloc]init];
    GUTTerminalContext *context = [[GUTTerminalContext alloc]init];
    
    [context setStrategy:strategy];
    return context;
}

+(GUTTerminalContext*)createPermissionsContext{
    id<GUTTerminalStrategy> strategy = [[GUTTerminalSetPermissions alloc]init];
    GUTTerminalContext *context = [[GUTTerminalContext alloc]init];
    
    [context setStrategy:strategy];
    return context;
}


@end

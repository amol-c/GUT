//
//  GUTTerminalStrategyFactory.h
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GUTTerminalContext.h"

@interface GUTTerminalStrategyFactory : NSObject

+(GUTTerminalContext*)createVerifyFolderContext;

+(GUTTerminalContext*)createCommitContext;

@end

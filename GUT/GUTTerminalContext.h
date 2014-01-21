//
//  GUTTerminalContext.h
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GUTTerminalStrategy.h"
@interface GUTTerminalContext : NSObject

@property (strong) id<GUTTerminalStrategy> strategy;
-(NSString*)execute:(NSArray*)arg;

@end

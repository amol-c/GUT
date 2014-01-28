//
//  GUTTerminalContext.m
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "GUTTerminalContext.h"

@implementation GUTTerminalContext

-(NSString*)execute:(NSArray *)arg{
   NSString *output = [_strategy execute:arg];
   return output;
}




@end

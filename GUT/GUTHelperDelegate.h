//
//  GUTHelperDelegate.h
//  GUT
//
//  Created by Amol Chaudhari on 1/19/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GUTHelperDelegate <NSObject>
-(NSString*)runCommand:(NSString *)commandToRun;

-(void)openDocumentWindow:(void (^)(NSString* urlName,NSArray *urlArray))block;
-(void)alertWithMessage:(NSString*)message;
-(NSString*)formatGitOutputConsoleForString:(NSString*)stringToFormat;
@end

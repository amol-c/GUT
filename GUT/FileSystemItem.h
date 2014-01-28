//
//  FileSystemItem.h
//  GUT
//
//  Created by Amol Chaudhari on 1/20/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileSystemItem : NSObject
{
    NSString *relativePath;
    FileSystemItem *parent;
    NSMutableArray *children;
}

- (FileSystemItem *)rootItem;
- (NSInteger)numberOfChildren;// Returns -1 for leaf nodes
- (FileSystemItem *)childAtIndex:(NSUInteger)n; // Invalid to call on leaf nodes
- (NSString *)fullPath;
- (NSString *)relativePath;

//Need to find better
- (id)initWithPath:(NSString *)path;
@end

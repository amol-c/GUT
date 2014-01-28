//
//  NSOutlineView+SelectedItems.m
//  GUT
//
//  Created by Amol Chaudhari on 1/21/14.
//  Copyright (c) 2014 Amol Chaudhari. All rights reserved.
//

#import "NSOutlineView+SelectedItems.h"

@implementation NSOutlineView (SelectedItems)

/* The methods in the following catagory were based upon those in OmniAppKit */

- (id)selectedItem
{
    if ([self numberOfSelectedRows] != 1) return nil;
    else return [self itemAtRow:[self selectedRow]];
}

- (NSArray *)selectedItems
{
    NSMutableArray *items = [NSMutableArray array];
#if MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_X_VERSION_10_3
    NSIndexSet *indicies = [self selectedRowIndexes];
    NSUInteger rowIndex = [indicies firstIndex];
    while (rowIndex != NSNotFound)
    {
        [items addObject:[self itemAtRow:rowIndex]];
        rowIndex = [indicies indexGreaterThanIndex:rowIndex];
    }
#else
    NSNumber *row;
    NSEnumerator *enumerator = [self selectedRowEnumerator];
    while (row = [enumerator nextObject])
        [items addObject:[self itemAtRow:[row intValue]]];
#endif
    
    return items;
}




@end

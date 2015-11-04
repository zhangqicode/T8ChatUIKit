//
//  T8MenuSection.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/24.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuSection.h"

@implementation T8MenuSection

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)addMenuItem:(T8MenuItem *)item
{
    [self.items addObject:item];
}

- (void)removeMenuItem:(T8MenuItem *)item
{
    [self.items removeObject:item];
}

@end

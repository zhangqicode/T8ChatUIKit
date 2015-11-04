//
//  T8MenuItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "T8MenuCell.h"

static NSString *const MenuItemPathSwitch = @"MenuItemPathSwitch";

@class T8MenuItem;

@protocol T8MenuItemDelegate <NSObject>

- (void)recieveMenuItemEvent:(NSString *)path item:(T8MenuItem *)item;

@end

@interface T8MenuItem : NSObject

@property (nonatomic) T8MenuCell *cell;
@property (nonatomic,weak) id<T8MenuItemDelegate> delegate;

- (CGFloat)itemHeight;

@end

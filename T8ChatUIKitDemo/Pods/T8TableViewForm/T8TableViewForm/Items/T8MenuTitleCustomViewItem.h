//
//  T8MenuTitleCustomViewItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/1.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

static NSString *const T8MenuTitleCustomViewItemTap = @"T8MenuTitleCustomViewItemTap";

@interface T8MenuTitleCustomViewItem : T8MenuItem

@property (nonatomic) UIView *customView;

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator customView:(UIView *)customView;

@end

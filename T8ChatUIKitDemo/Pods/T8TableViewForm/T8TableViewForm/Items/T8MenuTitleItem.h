//
//  T8MenuTitleItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

static NSString *const T8MenuTitleItemTap = @"T8MenuTitleItemTap";

@interface T8MenuTitleItem : T8MenuItem

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *subTitle;

- (id)initWithTitle:(NSString *)title;
- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator;
- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator subTitle:(NSString *)subTitle;

@end

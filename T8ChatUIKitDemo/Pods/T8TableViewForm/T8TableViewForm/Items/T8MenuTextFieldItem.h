//
//  T8MenuTextFieldItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/23.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

@interface T8MenuTextFieldItem : T8MenuItem

@property (nonatomic) NSString *text;

- (id)initWithPlaceHolder:(NSString *)placeHolder;
- (id)initWithPlaceHolder:(NSString *)placeHolder initialValue:(NSString *)initialValue;

@end

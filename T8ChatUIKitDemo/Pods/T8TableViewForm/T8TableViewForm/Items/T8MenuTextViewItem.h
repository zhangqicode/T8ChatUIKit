//
//  T8MenuTextViewItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/24.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

@interface T8MenuTextViewItem : T8MenuItem

@property (nonatomic) NSString *text;

- (id)initWithPlaceHolder:(NSString *)placeHolder andHeight:(CGFloat)height;
- (id)initWithPlaceHolder:(NSString *)placeHolder andHeight:(CGFloat)height initialValue:(NSString *)initialValue;

@end

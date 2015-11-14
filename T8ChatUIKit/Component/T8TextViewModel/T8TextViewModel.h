//
//  T8TextViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BaseViewModel.h"
#import <CoreText/CoreText.h>

@interface T8TextViewModel : T8BaseViewModel

@property (nonatomic, strong) NSString *text;
@property (nonatomic) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;

- (instancetype)initWithText:(NSString *)text font:(UIFont *)font;

- (void)layoutForContainerSize:(CGSize)containerSize;

@end

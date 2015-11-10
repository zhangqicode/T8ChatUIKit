//
//  T8LabelViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BaseViewModel.h"

#import <CoreText/CoreText.h>

@interface T8LabelViewModel : T8BaseViewModel

@property (nonatomic, strong) UIColor *textColor;

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor font:(CTFontRef)font maxWidth:(CGFloat)maxWidth;

- (void)setText:(NSString *)text maxWidth:(CGFloat)maxWidth;
- (NSString *)text;
- (void)setMaxWidth:(CGFloat)maxWidth;

@end

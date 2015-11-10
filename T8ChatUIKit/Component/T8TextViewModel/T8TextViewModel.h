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
@property (nonatomic) CTFontRef font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic) int lineCount;
@property (nonatomic, strong) NSArray *textCheckingResults;
@property (nonatomic) NSTextAlignment alignment;
@property (nonatomic) int layoutFlags;
@property (nonatomic) CGFloat additionalTrailingWidth;
@property (nonatomic, strong) NSArray *additionalAttributes;
@property (nonatomic, readonly) bool isRTL;

- (instancetype)initWithText:(NSString *)text font:(CTFontRef)font;

- (bool)layoutNeedsUpdatingForContainerSize:(CGSize)containerSize;
- (void)layoutForContainerSize:(CGSize)containerSize;
- (NSString *)linkAtPoint:(CGPoint)point regionData:(__autoreleasing NSArray **)regionData;

@end

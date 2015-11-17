//
//  T8View.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/17.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol T8View <NSObject>

- (CGRect)frame;
- (void)setFrame:(CGRect)frame;

- (CGFloat)alpha;
- (void)setAlpha:(CGFloat)alpha;

- (BOOL)hidden;
- (void)setHidden:(BOOL)hidden;

- (void)setViewIdentifier:(NSString *)viewIdentifier;
- (NSString *)viewIdentifier;
- (void)setViewStateIdentifier:(NSString *)viewStateIdentifier;
- (NSString *)viewStateIdentifier;

- (void)willBecomeRecycled;

@end

@interface UIView (T8View) <T8View>

@end

//
//  T8ImageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/12.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ImageViewModel.h"

@implementation T8ImageViewModel

- (Class)viewClass
{
    return [UIImageView class];
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
}

- (void)drawInContext:(CGContextRef)context
{
    [super drawInContext:context];
    
    if (!self.skipDrawInContext && self.alpha > FLT_EPSILON)
        [_image drawInRect:self.bounds blendMode:_blendMode alpha:1.0f];
}

@end

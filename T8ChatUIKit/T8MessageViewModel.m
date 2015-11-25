//
//  T8MessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageViewModel.h"

@interface T8MessageViewModel ()

@end

@implementation T8MessageViewModel

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super init];
    if (self) {
        
        _message = message;
                
    }
    return self;
}

- (Class)viewClass
{
    return [UIView class];
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];    
}

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize
{
    return CGSizeZero;
}

@end

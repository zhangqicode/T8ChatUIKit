//
//  T8SystemMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/25.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8SystemMessageViewModel.h"

@interface T8SystemMessageViewModel ()
{
    
}

@end

@implementation T8SystemMessageViewModel

- (id)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    self.frame = CGRectMake(0, 0, containerSize.width, 40);
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    UIView *view = self.boundView;
    view.backgroundColor = [UIColor greenColor];
}

@end

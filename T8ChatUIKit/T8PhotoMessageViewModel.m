//
//  T8PhotoMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/14.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8PhotoMessageViewModel.h"
#import "T8ImageViewModel.h"

@interface T8PhotoMessageViewModel ()
{
    T8ImageViewModel *_imageModel;
}

@end

@implementation T8PhotoMessageViewModel

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _imageModel = [[T8ImageViewModel alloc] init];
        [self addSubmodel:_imageModel];
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    CGSize size = [self contentSizeForContainerSize:containerSize];
    self.frame = CGRectMake(0, 0, containerSize.width, MAX(size.height + 20, 60));
    if (_message.incoming) {
        _imageModel.frame = CGRectMake(60, 10, size.width, size.height);
    }else{
        _imageModel.frame = CGRectMake(containerSize.width - 60 - size.width, 10, size.width, size.height);
    }
    
    [super layoutForContainerSize:containerSize];
}

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize
{
    return CGSizeMake(100, 100);
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    UIImageView *imageView = (UIImageView *)_imageModel.boundView;
    [imageView sd_setImageWithURL:[NSURL URLWithString:_message.avatar]];
}

@end

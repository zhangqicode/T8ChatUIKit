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
        
    }
    return self;
}

@end

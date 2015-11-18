//
//  T8ChannelLinkMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/18.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ChannelLinkMessageViewModel.h"
#import "T8ImageViewModel.h"

@interface T8ChannelLinkMessageViewModel ()
{
    T8ImageViewModel *_channelAvatarViewModel;
}

@end

@implementation T8ChannelLinkMessageViewModel

- (id)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _channelAvatarViewModel = [[T8ImageViewModel alloc] init];
        [self addSubmodel:_channelAvatarViewModel];
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    CGSize size = [self contentSizeForContainerSize:containerSize];
    self.frame = CGRectMake(0, 0, containerSize.width, size.height + 36);
    
    if (_message.incoming) {
        _channelAvatarViewModel.frame = CGRectMake(75, 18, 40, 40);
    }else{
        _channelAvatarViewModel.frame = CGRectMake(containerSize.width - 75 - size.width, 18, 40, 40);
    }
    
    [super layoutForContainerSize:containerSize];
}

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize
{
    return CGSizeMake(170, 60);
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    [_channelAvatarViewModel setUrl:_message.avatar];
}

@end

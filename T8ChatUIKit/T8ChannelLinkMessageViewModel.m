//
//  T8ChannelLinkMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/18.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ChannelLinkMessageViewModel.h"
#import "T8ImageViewModel.h"
#import "T8TextViewModel.h"

@interface T8ChannelLinkMessageViewModel ()
{
    T8ImageViewModel *_channelAvatarViewModel;
    T8TextViewModel *_titleViewModel;
    T8TextViewModel *_infoViewModel;
}

@end

@implementation T8ChannelLinkMessageViewModel

- (id)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _channelAvatarViewModel = [[T8ImageViewModel alloc] init];
        [self addSubmodel:_channelAvatarViewModel];
        
        _titleViewModel = [[T8TextViewModel alloc] initWithText:@"点击申请" font:[UIFont systemFontOfSize:14]];
        if (_message.incoming) {
            _titleViewModel.textColor = [UIColor colorWithRed:51/255.0 green:194/255.0 blue:32/255.0 alpha:1];
        }else{
            _titleViewModel.textColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:245/255.0 alpha:1];
        }
        [self addSubmodel:_titleViewModel];
        
        NSString *info = [NSString stringWithFormat:@"%@ #%@", _message.name, _message.content];
        _infoViewModel = [[T8TextViewModel alloc] initWithText:info font:[UIFont systemFontOfSize:12]];
        _infoViewModel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [self addSubmodel:_infoViewModel];
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
    
    [_titleViewModel layoutForContainerSize:CGSizeMake(size.width - 50, 0)];
    [_infoViewModel layoutForContainerSize:CGSizeMake(size.width - 50, 0)];
    
    _titleViewModel.frame = CGRectMake(CGRectGetMaxX(_channelAvatarViewModel.frame) + 10, CGRectGetMinY(_channelAvatarViewModel.frame), _titleViewModel.frame.size.width, _titleViewModel.frame.size.height);
    _infoViewModel.frame = CGRectMake(CGRectGetMinX(_titleViewModel.frame), CGRectGetMaxY(_titleViewModel.frame) + 3, _infoViewModel.frame.size.width, MIN(_infoViewModel.frame.size.height, 30));
    
    [super layoutForContainerSize:containerSize];
}

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize
{
    return CGSizeMake(170, 50);
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    [_channelAvatarViewModel setUrl:_message.avatar];
}

@end

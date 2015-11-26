//
//  T8AvatarViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/25.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8AvatarViewModel.h"
#import "T8LetteredAvatarViewModel.h"

@interface T8AvatarViewModel ()
{
    T8LetteredAvatarViewModel *_avatarModel;
}

@end

@implementation T8AvatarViewModel

- (id)initWithMessage:(id<T8Message>)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _avatarModel = [[T8LetteredAvatarViewModel alloc] init];
        [self addSubmodel:_avatarModel];

    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    if (_message.t8_incoming) {
        _avatarModel.frame = CGRectMake(10, 10, 40, 40);
    }else{
        _avatarModel.frame = CGRectMake(containerSize.width - 10 - 40, 10, 40, 40);
    }
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    [_avatarModel setAvatarUrl:_message.t8_avatar name:_message.t8_name];
}

@end

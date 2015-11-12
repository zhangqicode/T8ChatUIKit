//
//  T8MessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageViewModel.h"
#import "T8LetteredAvatarViewModel.h"

@interface T8MessageViewModel ()
{
    T8LetteredAvatarViewModel *_avatarModel;
    T8MessageModel *_message;
}

@end

@implementation T8MessageViewModel

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super init];
    if (self) {
        
        _message = message;
        
        _avatarModel = [[T8LetteredAvatarViewModel alloc] init];
        [self addSubmodel:_avatarModel];
        
    }
    return self;
}

- (Class)viewClass
{
    return [UIView class];
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    _avatarModel.frame = CGRectMake(0, 0, 40, 40);
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    [_avatarModel setAvatarUrl:_message.avatar name:_message.name];
}

@end

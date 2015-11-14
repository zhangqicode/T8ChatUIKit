//
//  T8MessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageViewModel.h"
#import "T8LetteredAvatarViewModel.h"
#import "T8BubbleBgViewModel.h"

@interface T8MessageViewModel ()
{
    T8LetteredAvatarViewModel *_avatarModel;
    T8BubbleBgViewModel *_bubbleBgModel;
}

@end

@implementation T8MessageViewModel

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super init];
    if (self) {
        
        _message = message;
        
        _avatarModel = [[T8LetteredAvatarViewModel alloc] init];
        _bubbleBgModel = [[T8BubbleBgViewModel alloc] initWithType:_message.incoming?T8BubbleBgTypeIncoming:T8BubbleBgTypeOutgoing];
        [self addSubmodel:_avatarModel];
        [self addSubmodel:_bubbleBgModel];
        
    }
    return self;
}

- (Class)viewClass
{
    return [UIView class];
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    if (_message.incoming) {
        _avatarModel.frame = CGRectMake(10, 10, 40, 40);
    }else{
        _avatarModel.frame = CGRectMake(containerSize.width - 10 - 40, 10, 40, 40);
    }
    
    CGSize contentContainerSize = CGSizeMake(containerSize.width - 150.0f, containerSize.height);
    CGSize contentSize = [self contentSizeForContainerSize:contentContainerSize];
    contentSize.width = MAX(contentSize.width, 60) + 30;
    contentSize.height = MAX(contentSize.height + 30, 54);
    if (_message.incoming) {
        _bubbleBgModel.frame = CGRectMake(60, 7.5, contentSize.width, contentSize.height);
    }else{
        _bubbleBgModel.frame = CGRectMake(containerSize.width - contentSize.width - 60, 7.5, contentSize.width, contentSize.height);
    }
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    [_avatarModel setAvatarUrl:_message.avatar name:_message.name];
}

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize
{
    return CGSizeZero;
}

@end

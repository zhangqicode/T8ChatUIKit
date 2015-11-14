//
//  T8BubbleMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/14.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BubbleMessageViewModel.h"
#import "T8BubbleBgViewModel.h"

@interface T8BubbleMessageViewModel ()
{
    T8BubbleBgViewModel *_bubbleBgModel;
}

@end

@implementation T8BubbleMessageViewModel

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _message = message;
        
        _bubbleBgModel = [[T8BubbleBgViewModel alloc] initWithType:_message.incoming?T8BubbleBgTypeIncoming:T8BubbleBgTypeOutgoing];
        [self addSubmodel:_bubbleBgModel];
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    CGSize contentContainerSize = CGSizeMake(containerSize.width - 150.0f, containerSize.height);
    CGSize contentSize = [self contentSizeForContainerSize:contentContainerSize];
    contentSize.width = MAX(contentSize.width, 60) + 30;
    contentSize.height = MAX(contentSize.height + 30, 54);
    if (_message.incoming) {
        _bubbleBgModel.frame = CGRectMake(60, 7.5, contentSize.width, contentSize.height);
    }else{
        _bubbleBgModel.frame = CGRectMake(containerSize.width - contentSize.width - 60, 7.5, contentSize.width, contentSize.height);
    }
    
    [super layoutForContainerSize:containerSize];
}

@end

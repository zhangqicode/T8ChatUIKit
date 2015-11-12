//
//  T8MessageViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BaseViewModel.h"
#import "T8MessageModel.h"

@interface T8MessageViewModel : T8BaseViewModel
{
    T8MessageModel *_message;
}

- (instancetype)initWithMessage:(T8MessageModel *)message;

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize;

@end

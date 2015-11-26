//
//  T8MessageItem.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "T8Message.h"

@class T8MessageViewModel;
@class T8ChatBaseCollectionViewCell;

@interface T8MessageItem : NSObject
{
    @public id<T8Message> _message;
    T8MessageViewModel *_viewModel;
}

- (instancetype)initWithMessage:(id<T8Message>)message;

- (void)bindCell:(T8ChatBaseCollectionViewCell *)cell;
- (void)unbindCell;
- (T8ChatBaseCollectionViewCell *)boundCell;

- (T8MessageViewModel *)viewModel;
- (CGSize)sizeForContainerSize:(CGSize)containerSize;

@end

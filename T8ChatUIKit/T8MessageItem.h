//
//  T8MessageItem.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class T8MessageModel;
@class T8MessageViewModel;
@class T8ChatBaseCollectionViewCell;

@interface T8MessageItem : NSObject
{
    @public T8MessageModel *_message;
    T8MessageViewModel *_viewModel;
}

- (instancetype)initWithMessage:(T8MessageModel *)message;

- (void)bindCell:(T8ChatBaseCollectionViewCell *)cell;
- (void)unbindCell;
- (T8ChatBaseCollectionViewCell *)boundCell;

- (T8MessageViewModel *)viewModel;
- (CGSize)sizeForContainerSize:(CGSize)containerSize;

@end

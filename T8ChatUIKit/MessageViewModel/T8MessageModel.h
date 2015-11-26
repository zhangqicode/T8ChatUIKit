//
//  T8MessageModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/6.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "T8Message.h"

@interface T8MessageModel : NSObject<T8Message>

- (CGSize)sizeForContainerSize:(CGSize)containerSize;

@end

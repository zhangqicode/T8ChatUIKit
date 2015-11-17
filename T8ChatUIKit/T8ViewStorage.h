//
//  T8ViewStorage.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/17.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "T8View.h"

@interface T8ViewStorage : NSObject

- (UIView<T8View> *)dequeueViewWithIdentifier:(NSString *)identifier viewStateIdentifier:(NSString *)viewStateIdentifier;
- (void)enqueueView:(UIView<T8View> *)view;

@end

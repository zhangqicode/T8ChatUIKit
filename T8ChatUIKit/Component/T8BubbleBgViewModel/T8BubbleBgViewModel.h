//
//  T8BubbleBgViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/13.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ImageViewModel.h"

typedef enum : NSUInteger {
    T8BubbleBgTypeIncoming,
    T8BubbleBgTypeOutgoing
} T8BubbleBgType;

@interface T8BubbleBgViewModel : T8ImageViewModel

- (id)initWithType:(T8BubbleBgType)type;

@end

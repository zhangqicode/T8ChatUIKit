//
//  T8ChatViewController.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/5.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    T8MessageItemInsertTypeSend,
    T8MessageItemInsertTypeRecieve,
    T8MessageItemInsertTypeLoadMore,
} T8MessageItemInsertType;

@interface T8ChatViewController : UIViewController

- (void)insertItems:(NSArray *)items insertType:(T8MessageItemInsertType)insertType;

@end

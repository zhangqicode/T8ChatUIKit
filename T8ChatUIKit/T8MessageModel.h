//
//  T8MessageModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/6.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface T8MessageModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *content;
@property (nonatomic) NSInteger type;

- (CGSize)sizeForContainerSize:(CGSize)containerSize;

@end

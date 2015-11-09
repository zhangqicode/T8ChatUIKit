//
//  T8BaseViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/7.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface T8BaseViewModel : NSObject

@property (nonatomic) CGRect frame;
@property (nonatomic) CGFloat alpha;
@property (nonatomic) BOOL hidden;

@property (nonatomic, strong, readonly) NSArray *submodels;

- (Class)viewClass;
- (UIView *)boundView;

- (void)bindViewToContainer:(UIView *)container;
- (void)unbindView;

@end

//
//  T8MenuSwitchItem.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/14.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

@interface T8MenuSwitchItem : T8MenuItem

@property (nonatomic) NSString *title;
@property (nonatomic,assign) BOOL isOn;

- (id)initWithTitle:(NSString *)title isOn:(BOOL)on;

@end

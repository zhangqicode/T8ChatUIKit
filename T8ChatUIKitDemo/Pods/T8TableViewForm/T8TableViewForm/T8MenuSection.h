//
//  T8MenuSection.h
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/24.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "T8MenuItem.h"

@interface T8MenuSection : NSObject

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) UIEdgeInsets sectionEdgeInsets;

- (void)addMenuItem:(T8MenuItem *)item;

- (void)removeMenuItem:(T8MenuItem *)item;

@end

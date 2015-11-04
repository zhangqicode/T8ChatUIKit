//
//  T8MenuItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuItem.h"

@implementation T8MenuItem

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (CGFloat)itemHeight
{
    return 0;
}

- (void)setCell:(T8MenuCell *)cell
{
    _cell = cell;
    
    [self.cell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)]];
}

- (void)cellTapped:(UITapGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:@"" item:self];
    }
}

@end

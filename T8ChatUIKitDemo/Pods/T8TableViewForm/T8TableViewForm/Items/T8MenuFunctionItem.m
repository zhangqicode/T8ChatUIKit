//
//  T8MenuFunctionItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/6.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuFunctionItem.h"
#import "T8MenuFunctionCell.h"

@implementation T8MenuFunctionItem

- (id)initWithFunctionTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuFunctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        self.cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        ((T8MenuFunctionCell *)self.cell).titleLabel.text = title;
    }
    return self;
}

- (CGFloat)itemHeight
{
    return 45;
}

- (void)cellTapped:(UITapGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:T8MenuFunctionItemTap item:self];
    }
}

@end

//
//  T8MenuSwitchItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/7/14.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuSwitchItem.h"
#import "T8MenuSwitchCell.h"

@implementation T8MenuSwitchItem

- (id)initWithTitle:(NSString *)title isOn:(BOOL)on
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        self.cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        ((T8MenuSwitchCell *)self.cell).titleLabel.text = title;
        ((T8MenuSwitchCell *)self.cell).switchItem.on = on;
        [((T8MenuSwitchCell *)self.cell).switchItem addTarget:self action:@selector(switchValueChanged) forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

- (CGFloat)itemHeight
{
    return 45;
}

#pragma mark - method
- (void)switchValueChanged
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:MenuItemPathSwitch item:self];
    }
}

#pragma mark - getter
- (NSString *)title
{
    return ((T8MenuSwitchCell *)self.cell).titleLabel.text;
}

- (BOOL)isOn
{
    return ((T8MenuSwitchCell *)self.cell).switchItem.on;
}

#pragma mark - setter
- (void)setTitle:(NSString *)title
{
    ((T8MenuSwitchCell *)self.cell).titleLabel.text = title;
}

- (void)setIsOn:(BOOL)isOn
{
    ((T8MenuSwitchCell *)self.cell).switchItem.on = isOn;
}

@end

//
//  T8MenuTitleItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTitleItem.h"
#import "T8MenuTitleCell.h"

@implementation T8MenuTitleItem

- (id)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title indicator:NO];
}

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator
{
    return [self initWithTitle:title indicator:indicator subTitle:nil];
}

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator subTitle:(NSString *)subTitle
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        self.cell.selectionStyle = UITableViewCellSelectionStyleNone;
        ((T8MenuTitleCell *)self.cell).titleLabel.text = title;
        if (indicator) {
            self.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            [((T8MenuTitleCell *)self.cell).subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.cell.contentView);
                make.centerY.equalTo(self.cell.contentView);
            }];
        }
        ((T8MenuTitleCell *)self.cell).subTitleLabel.text = subTitle;
    }
    return self;
}

- (void)cellTapped:(UITapGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:T8MenuTitleItemTap item:self];
    }
}

- (CGFloat)itemHeight
{
    return 45;
}

#pragma mark - getter
- (NSString *)title
{
    return ((T8MenuTitleCell *)self.cell).titleLabel.text;
}

- (NSString *)subTitle
{
    return ((T8MenuTitleCell *)self.cell).subTitleLabel.text;
}

#pragma mark - setter
- (void)setTitle:(NSString *)title
{
    ((T8MenuTitleCell *)self.cell).titleLabel.text = title;
}

- (void)setSubTitle:(NSString *)subTitle
{
    ((T8MenuTitleCell *)self.cell).subTitleLabel.text = subTitle;
}

@end

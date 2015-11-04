//
//  T8MenuTextViewCell.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/24.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTextViewCell.h"

@implementation T8MenuTextViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.textView];
        
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(12.5, 16, 12.5, 16));
        }];
    }
    return self;
}

#pragma mark - getter
- (T8PlaceHolderTextView *)textView
{
    if (!_textView) {
        _textView = [[T8PlaceHolderTextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:15];
        _textView.textColor = [UIColor colorWithRed:64/255.0 green:64/255.0 blue:64/255.0 alpha:1];
        _textView.textContainerInset = UIEdgeInsetsZero;
    }
    return _textView;
}

@end

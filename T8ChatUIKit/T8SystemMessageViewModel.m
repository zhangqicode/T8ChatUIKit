//
//  T8SystemMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/25.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8SystemMessageViewModel.h"
#import "T8TextViewModel.h"

@interface T8SystemMessageViewModel ()
{
    T8TextViewModel *_contentLabel;
}

@end

@implementation T8SystemMessageViewModel

- (id)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _contentLabel = [[T8TextViewModel alloc] initWithText:@"user#4889 joined chat" font:[UIFont systemFontOfSize:12]];
        _contentLabel.textColor = [UIColor whiteColor];
        [self addSubmodel:_contentLabel];
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    [_contentLabel layoutForContainerSize:CGSizeMake(containerSize.width - 120, 0)];
    _contentLabel.frame = CGRectMake((containerSize.width - _contentLabel.frame.size.width)/2, 5, _contentLabel.frame.size.width + 10, _contentLabel.frame.size.height + 10);
    
    self.frame = CGRectMake(0, 0, containerSize.width, _contentLabel.frame.size.height + 10);
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    UILabel *contentLabel = (UILabel *)_contentLabel.boundView;
    contentLabel.backgroundColor = [UIColor colorWithRed:206/255.0 green:213/255.0 blue:217/255.0 alpha:1];
    contentLabel.layer.cornerRadius = 5;
    contentLabel.layer.masksToBounds = YES;
    contentLabel.textAlignment = NSTextAlignmentCenter;
}

@end

//
//  T8ChatBaseCollectionViewCell.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/5.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ChatBaseCollectionViewCell.h"

@interface T8ChatBaseCollectionViewCell ()
{
    UIView *_contentViewForBinding;
    UILabel *_testLabel;
}

@end

@implementation T8ChatBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _contentViewForBinding = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _contentViewForBinding.transform = CGAffineTransformMakeRotation(M_PI);
        [self addSubview:_contentViewForBinding];
        
        self.clipsToBounds = YES;

    }
    return self;
}

- (UIView *)contentViewForBinding
{
    return _contentViewForBinding;
}

@end

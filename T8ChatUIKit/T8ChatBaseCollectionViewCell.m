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
        
        _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _testLabel.textColor = [UIColor blackColor];
        _testLabel.text = @"hello world...";
        _testLabel.layer.borderColor = [[UIColor blackColor] CGColor];
        _testLabel.layer.borderWidth = 1;
        [_contentViewForBinding addSubview:_testLabel];
        
    }
    return self;
}

@end

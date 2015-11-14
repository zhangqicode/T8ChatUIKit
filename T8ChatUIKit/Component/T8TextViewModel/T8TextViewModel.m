//
//  T8TextViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8TextViewModel.h"

@interface T8TextViewModel ()
{
    
}

@end

@implementation T8TextViewModel

- (instancetype)initWithText:(NSString *)text font:(UIFont *)font
{
    self = [super init];
    if (self != nil)
    {
        if (text.length != 0)
            _text = text;
        else
            _text = @" ";
        
        if (font != NULL)
            _font = font;
    }
    return self;
}

- (void)dealloc
{
    
}

- (Class)viewClass
{
    return [UILabel class];
}

- (void)sizeToFit
{
    
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    CGRect rect = [_text boundingRectWithSize:containerSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _font} context:nil];
    self.frame = CGRectMake(0, 0, ceil(rect.size.width), ceil(rect.size.height));
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    UILabel *textLabel = (UILabel *)self.boundView;
    textLabel.numberOfLines = 0;
    textLabel.text = _text;
    textLabel.font = _font;
    textLabel.textColor = _textColor;
}

@end

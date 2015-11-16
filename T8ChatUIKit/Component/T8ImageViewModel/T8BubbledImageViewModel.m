//
//  T8BubbledImageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/16.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BubbledImageViewModel.h"
#import "T8BubbledImageView.h"
#import "SDWebImageManager.h"

@implementation T8BubbledImageViewModel

- (Class)viewClass
{
    return [T8BubbledImageView class];
}

- (void)setUrlStr:(NSString *)urlStr
{
    if (![urlStr isEqualToString:_urlStr]) {
        _urlStr = urlStr;
        
    }
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    __weak typeof(self) weakSelf = self;
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.urlStr] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        weakSelf.bubbleImage = image;
        T8BubbledImageView *imgView = (T8BubbledImageView *)weakSelf.boundView;
        if (imgView) {
            imgView.bubbleImage = image;
            imgView.incoming = weakSelf.incoming;
            imgView.backgroundColor = [UIColor clearColor];
            [imgView setNeedsDisplay];
        }
    }];
}

@end

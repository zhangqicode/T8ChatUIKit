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
    
    T8BubbledImageView *imgView = (T8BubbledImageView *)self.boundView;
    imgView.backgroundColor = [UIColor clearColor];
    imgView.incoming = self.incoming;
    imgView.layer.drawsAsynchronously = YES;
    
    if (self.bubbleImage == nil) {
        __weak typeof(self) weakSelf = self;
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.urlStr] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            weakSelf.bubbleImage = image;
            [weakSelf updateBubbleImageView];
        }];
    }

}

- (void)updateBubbleImageView
{
    T8BubbledImageView *imgView = (T8BubbledImageView *)self.boundView;
    if (imgView && imgView.bubbleImage != self.bubbleImage) {
        imgView.bubbleImage = self.bubbleImage;
        [imgView setNeedsDisplay];
    }
}

@end

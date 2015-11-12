//
//  T8LetteredAvatarViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/12.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8LetteredAvatarViewModel.h"
#import "UIImageView+WebCache.h"

static UIImage *defaultAvatar = nil;

@implementation T8LetteredAvatarViewModel

- (id)init
{
    self = [super init];
    if (self) {
        static dispatch_once_t onceTokenLetteredAvatarViewModel;
        dispatch_once(&onceTokenLetteredAvatarViewModel, ^{
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(40.0f, 40.0f), false, 0.0f);
            CGContextRef context = UIGraphicsGetCurrentContext();
            
            //!placeholder
            CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
            CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 40.0f, 40.0f));
            CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1].CGColor);
            CGContextSetLineWidth(context, 1.0f);
            CGContextStrokeRect(context, CGRectMake(0.5f, 0.5f, 39.0f, 39.0f));
            
            defaultAvatar = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        });
    }
    return self;
}

- (Class)viewClass
{
    return [UIImageView class];
}

- (void)setAvatarUrl:(NSString *)avatar name:(NSString *)name
{
    if (avatar.length > 0) {
        [((UIImageView *)self.boundView) sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:defaultAvatar];
    }else if (name.length > 0){
        
    }else{
        ((UIImageView *)self.boundView).image = defaultAvatar;
    }
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
}

- (void)unbindView
{
    [super unbindView];
    
    ((UIImageView *)self.boundView).image = defaultAvatar;
}

@end

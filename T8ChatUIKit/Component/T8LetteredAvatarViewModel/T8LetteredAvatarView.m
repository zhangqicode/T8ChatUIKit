//
//  T8LetteredAvatarView.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/12.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8LetteredAvatarView.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "Masonry.h"

@interface T8LetteredAvatarView ()
{
    UILabel *_nameLabel;
}

@end

@implementation T8LetteredAvatarView

- (id)init
{
    self = [super init];
    if (self) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:24];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.hidden = YES;
        _nameLabel.layer.borderColor = [[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1] CGColor];
        _nameLabel.layer.borderWidth = 1;
        _nameLabel.backgroundColor = [UIColor redColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}

- (void)setAvatar:(NSString *)avatar Name:(NSString *)name
{
    _nameLabel.hidden = YES;
    if (avatar && avatar.length>0) {
        self.image = nil;
        [self sd_setImageWithURL:[NSURL URLWithString:avatar]];
    }else if (name.length>0) {
        self.image = nil;
        _nameLabel.text = [name substringToIndex:1];
        _nameLabel.hidden = NO;
    }
}

@end

//
//  T8ImageViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/12.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BaseViewModel.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface T8ImageViewModel : T8BaseViewModel

@property (nonatomic, strong) UIImage *image;
@property (nonatomic) CGBlendMode blendMode;

@end

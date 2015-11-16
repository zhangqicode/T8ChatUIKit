//
//  T8BubbledImageViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/16.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ImageViewModel.h"

@interface T8BubbledImageViewModel : T8ImageViewModel

@property (strong, nonatomic) NSString *urlStr;
@property (nonatomic) BOOL incoming;
@property (strong, nonatomic) UIImage *bubbleImage;

@end

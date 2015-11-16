//
//  T8BubbledImageView.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/16.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BubbledImageView.h"

@implementation T8BubbledImageView

- (void)drawRect:(CGRect)rect
{
    
    CGFloat radius = 5;
    CGFloat marginX = 6;
    CGFloat marginY = 1;
    CGFloat cornerCenterY = 16;
    CGFloat cornerHeight = 10;
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //顺时针划线，上部开始
    [path moveToPoint:CGPointMake(marginX + radius, marginY)];
    [path addLineToPoint:CGPointMake(width - marginX - radius, marginY)];
    [path addArcWithCenter:CGPointMake(width - marginX - radius, marginY + radius) radius:radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
    
    //右边
    if (!self.incoming) {
        //右边尖角
        [path addLineToPoint:CGPointMake(width - marginX, cornerCenterY - cornerHeight/2)];
        [path addLineToPoint:CGPointMake(width, cornerCenterY)];
        [path addLineToPoint:CGPointMake(width - marginX, cornerCenterY + cornerHeight/2)];
    }else{
        [path addLineToPoint:CGPointMake(width - marginX, height - marginY - radius)];
    }
    [path addArcWithCenter:CGPointMake(width - marginX - radius, height - marginY - radius) radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    //下边
    [path addLineToPoint:CGPointMake(marginX + radius, height - marginY)];
    [path addArcWithCenter:CGPointMake(marginX + radius, height - marginY - radius) radius:radius startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    
    //左边
    if (self.incoming) {
        //左边尖角
        [path addLineToPoint:CGPointMake(marginX, cornerCenterY + cornerHeight/2)];
        [path addLineToPoint:CGPointMake(0, cornerCenterY)];
        [path addLineToPoint:CGPointMake(marginX, cornerCenterY - cornerHeight/2)];
    }else{
        [path addLineToPoint:CGPointMake(marginX, marginY + radius)];
    }
    [path addArcWithCenter:CGPointMake(marginX + radius, marginY + radius) radius:radius startAngle:M_PI endAngle:3*M_PI_2 clockwise:YES];
    [path closePath];
    
    [[UIColor colorWithRed:207/255.0 green:207/255.0 blue:207/255.0 alpha:1] setStroke];
    [path setLineWidth:1];
    [path stroke];
    
    [path addClip];
    
    [_bubbleImage drawInRect:rect];
}

@end

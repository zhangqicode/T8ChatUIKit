//
//  T8TextMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8TextMessageViewModel.h"
#import "T8TextViewModel.h"

@interface T8TextMessageViewModel ()
{
    T8TextViewModel *_textModel;
}

@end

@implementation T8TextMessageViewModel

- (instancetype)initWithMessage:(id<T8Message>)message
{
    self = [super initWithMessage:message];
    if (self) {

        _textModel = [[T8TextViewModel alloc] initWithText:[message t8_content] font:[UIFont systemFontOfSize:14]];
        _textModel.textColor = [UIColor blackColor];
        
        [self addSubmodel:_textModel];
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    CGSize contentContainerSize = CGSizeMake(containerSize.width - 150.0f, containerSize.height);
    [_textModel layoutForContainerSize:contentContainerSize];
    CGSize contentSize = [self contentSizeForContainerSize:contentContainerSize];
    self.frame = CGRectMake(0, 0, containerSize.width, MAX(60, contentSize.height + 36));
    
    contentSize.height = MAX(contentSize.height, 24);
    if (_message.t8_incoming) {
        _textModel.frame = CGRectMake(75, 18, contentSize.width, contentSize.height);
    }else{
        _textModel.frame = CGRectMake(containerSize.width - 75 - contentSize.width, 18, contentSize.width, contentSize.height);
    }
    
    [super layoutForContainerSize:containerSize];
}

- (CGSize)contentSizeForContainerSize:(CGSize)containerSize
{
    return _textModel.frame.size;
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
}

//- (void)_updateSubmodelContentsForLayer:(CALayer *)layer visibleRect:(CGRect)visibleRect
//{
//    CGRect clipRect = CGRectIntersection(visibleRect, CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height));
//    if (clipRect.size.height < FLT_EPSILON)
//        return;
//    
//    CGSize contextSize = clipRect.size;
//    CGContextRef context = [T8TextMessageViewModel _createContentContext:contextSize];
//    UIGraphicsPushContext(context);
//    
//    CGContextTranslateCTM(context, contextSize.width / 2.0f, contextSize.height / 2.0f);
//    CGContextScaleCTM(context, 1.0f, -1.0f);
//    CGContextTranslateCTM(context, -contextSize.width / 2.0f, -contextSize.height / 2.0f);
//    
//    if (visibleRect.origin.y > FLT_EPSILON)
//        CGContextTranslateCTM(context, 0.0f, -visibleRect.origin.y);
//    
//    [self drawSubmodelsInContext:context];
//    
//    UIGraphicsPopContext();
//    
//    CGImageRef contextImageRef = CGBitmapContextCreateImage(context);
//    CGContextRelease(context);
//    
//    layer.contents = (__bridge id)(contextImageRef);
//    CGImageRelease(contextImageRef);
//}
//
//+ (CGContextRef)_createContentContext:(CGSize)size
//{
//    CGSize contextSize = size;
//    CGFloat scaling = [UIScreen mainScreen].scale;
//    
//    contextSize.width *= scaling;
//    contextSize.height *= scaling;
//    
//    size_t bytesPerRow = 4 * (int)contextSize.width;
//    //作用是向上取整为16的倍数
//    bytesPerRow = (bytesPerRow + 15) & ~15;
//    
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    
//    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Host;
//    
//    CGContextRef context = CGBitmapContextCreate(NULL, (int)contextSize.width, (int)contextSize.height, 8, bytesPerRow, colorSpace, bitmapInfo);
//    CGColorSpaceRelease(colorSpace);
//    
//    CGContextScaleCTM(context, scaling, scaling);
//    
//    return context;
//}

@end

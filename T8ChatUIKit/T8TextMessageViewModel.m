//
//  T8TextMessageViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/9.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8TextMessageViewModel.h"
#import "T8TextViewModel.h"
#import "T8LabelViewModel.h"

@interface T8TextMessageViewModel ()
{
    T8LabelViewModel *_labelModel;
}

@end

@implementation T8TextMessageViewModel

- (instancetype)initWithMessage:(T8MessageModel *)message
{
    self = [super initWithMessage:message];
    if (self) {
        
        _labelModel = [[T8LabelViewModel alloc] initWithText:message.content textColor:[UIColor blackColor] font:CTFontCreateWithName(CFSTR("HelveticaNeue"), floorf(14 * 2.0f) / 2.0f, NULL) maxWidth:200];
        
        [self addSubmodel:_labelModel];
        
    }
    return self;
}

- (void)layoutForContainerSize:(CGSize)containerSize
{
    self.frame = CGRectMake(0, 0, containerSize.width, 50);
    
    _labelModel.frame = CGRectMake(0, 0, containerSize.width, 50);
    
    [super layoutForContainerSize:containerSize];
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    [self _updateSubmodelContentsForLayer:container.layer visibleRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

- (void)_updateSubmodelContentsForLayer:(CALayer *)layer visibleRect:(CGRect)visibleRect
{
    CGRect clipRect = CGRectIntersection(visibleRect, CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height));
    if (clipRect.size.height < FLT_EPSILON)
        return;
    
    CGSize contextSize = clipRect.size;
    CGContextRef context = [T8TextMessageViewModel _createContentContext:contextSize];
    UIGraphicsPushContext(context);
    
    CGContextTranslateCTM(context, contextSize.width / 2.0f, contextSize.height / 2.0f);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextTranslateCTM(context, -contextSize.width / 2.0f, -contextSize.height / 2.0f);
    
    if (visibleRect.origin.y > FLT_EPSILON)
        CGContextTranslateCTM(context, 0.0f, -visibleRect.origin.y);
    
    [self drawSubmodelsInContext:context];
    
    UIGraphicsPopContext();
    
    CGImageRef contextImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    
    layer.contents = (__bridge id)(contextImageRef);
    CGImageRelease(contextImageRef);
}

+ (CGContextRef)_createContentContext:(CGSize)size
{
    CGSize contextSize = size;
    CGFloat scaling = [UIScreen mainScreen].scale;
    
    contextSize.width *= scaling;
    contextSize.height *= scaling;
    
    size_t bytesPerRow = 4 * (int)contextSize.width;
    //作用是向上取整为16的倍数
    bytesPerRow = (bytesPerRow + 15) & ~15;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Host;
    
    CGContextRef context = CGBitmapContextCreate(NULL, (int)contextSize.width, (int)contextSize.height, 8, bytesPerRow, colorSpace, bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    
    CGContextScaleCTM(context, scaling, scaling);
    
    return context;
}

@end

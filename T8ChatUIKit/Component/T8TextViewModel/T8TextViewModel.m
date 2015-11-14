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
//    TGReusableLabelLayoutData *_layoutData;
    CGFloat _cachedLayoutContainerWidth;
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
    return [UIView class];
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
    
    UIView *view = (UIView *)self.boundView;
    view.backgroundColor = [UIColor greenColor];
}

//- (void)drawInContext:(CGContextRef)context
//{
//    [super drawInContext:context];
//    
//    if (_layoutData != nil)
//    {
//        //qi.zhang modify, from 0 to 4
//        [TGReusableLabel drawRichTextInRect:CGRectMake(0, 4, self.bounds.size.width, self.bounds.size.height) precalculatedLayout:_layoutData linesRange:NSMakeRange(0, 0) shadowColor:nil shadowOffset:CGSizeZero];
//    }
//}
//
//- (bool)layoutNeedsUpdatingForContainerSize:(CGSize)containerSize
//{
//    if (_layoutData == nil || ABS(containerSize.width - _cachedLayoutContainerWidth) > FLT_EPSILON)
//        return true;
//    return false;
//}
//
//- (void)setText:(NSString *)text
//{
//    if (!TGStringCompare(_text, text))
//    {
//        _cachedLayoutContainerWidth = 0.0f;
//        
//        if (text.length != 0)
//            _text = text;
//        else
//            _text = @" ";
//    }
//}
//
//- (void)setFont:(CTFontRef)font
//{
//    if (_font != font)
//    {
//        _cachedLayoutContainerWidth = 0.0f;
//        
//        if (_font != NULL)
//        {
//            CFRelease(_font);
//            _font = NULL;
//        }
//        
//        if (font != NULL)
//            _font = CFRetain(font);
//    }
//}
//
//- (void)layoutForContainerSize:(CGSize)containerSize
//{
//    if (_layoutData == nil || ABS(containerSize.width - _cachedLayoutContainerWidth) > FLT_EPSILON)
//    {
//        _layoutData = [TGReusableLabel calculateLayout:_text additionalAttributes:_additionalAttributes textCheckingResults:_textCheckingResults font:_font textColor:_textColor frame:CGRectZero orMaxWidth:containerSize.width flags:_layoutFlags textAlignment:(UITextAlignment)_alignment outIsRTL:&_isRTL additionalTrailingWidth:_additionalTrailingWidth];
//        _cachedLayoutContainerWidth = containerSize.width;
//    }
//    
//    CGRect frame = self.frame;
//    frame.size = _layoutData.size;
//    frame.size.width = CGFloor(frame.size.width);
//    frame.size.height = CGFloor(frame.size.height);
//    self.frame = frame;
//}
//
//- (NSString *)linkAtPoint:(CGPoint)point regionData:(__autoreleasing NSArray **)regionData
//{
//    CGRect topRegion = CGRectZero;
//    CGRect middleRegion = CGRectZero;
//    CGRect bottomRegion = CGRectZero;
//    
//    NSString *result = [_layoutData linkAtPoint:point topRegion:&topRegion middleRegion:&middleRegion bottomRegion:&bottomRegion];
//    if (result != nil)
//    {
//        NSMutableArray *array = [[NSMutableArray alloc] init];
//        if (!CGRectIsEmpty(topRegion))
//            [array addObject:[NSValue valueWithCGRect:topRegion]];
//        if (!CGRectIsEmpty(middleRegion))
//            [array addObject:[NSValue valueWithCGRect:middleRegion]];
//        if (!CGRectIsEmpty(bottomRegion))
//            [array addObject:[NSValue valueWithCGRect:bottomRegion]];
//        
//        if (regionData != NULL)
//            *regionData = array;
//    }
//    
//    return result;
//}

@end

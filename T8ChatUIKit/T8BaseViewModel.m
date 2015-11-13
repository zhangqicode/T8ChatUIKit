//
//  T8BaseViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/7.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BaseViewModel.h"

@interface T8BaseViewModel ()
{
    UIView *_view;
    
    NSMutableArray *_submodels;
}

@end

@implementation T8BaseViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _alpha = 1.0f;
    }
    return self;
}

- (bool)hasNoView
{
    return _modelFlags.hasNoView;
}

- (void)setHasNoView:(bool)hasNoView
{
    _modelFlags.hasNoView = hasNoView;
}

- (bool)skipDrawInContext
{
    return _modelFlags.skipDrawInContext;
}

- (void)setSkipDrawInContext:(bool)skipDrawInContext
{
    _modelFlags.skipDrawInContext = skipDrawInContext;
}

- (bool)disableSubmodelAutomaticBinding
{
    return _modelFlags.disableSubmodelAutomaticBinding;
}

- (void)setDisableSubmodelAutomaticBinding:(bool)disableSubmodelAutomaticBinding
{
    _modelFlags.disableSubmodelAutomaticBinding = disableSubmodelAutomaticBinding;
}

- (bool)viewUserInteractionDisabled
{
    return _modelFlags.viewUserInteractionDisabled;
}

- (void)setViewUserInteractionDisabled:(bool)viewUserInteractionDisabled
{
    if (_modelFlags.viewUserInteractionDisabled != viewUserInteractionDisabled)
    {
        _modelFlags.viewUserInteractionDisabled = viewUserInteractionDisabled;
        _view.userInteractionEnabled = !viewUserInteractionDisabled;
    }
}

#pragma mark - method
- (void)bindViewToContainer:(UIView *)container
{
    if (_view == nil) {
        _view = [[[self viewClass] alloc] init];
    }
    
    if (_view) {
        [container addSubview:_view];
        
        [_view setFrame:_frame];
        [_view setAlpha:_alpha];
        [_view setHidden:_hidden];
        
        for (T8BaseViewModel *submodel in self.submodels) {
            [submodel bindViewToContainer:_view];
        }
    }
}

- (void)unbindView
{
    for (T8BaseViewModel *submodel in self.submodels) {
        [submodel unbindView];
    }
    
    if (_view) {
        [_view removeFromSuperview];
        _view = nil;
    }
}

- (Class)viewClass
{
    return nil;
}

- (void)addSubmodel:(T8BaseViewModel *)model
{
    if (model == nil) {
        return;
    }
    
    if (_submodels == nil) {
        _submodels = [NSMutableArray array];
    }
    
    [_submodels addObject:model];
}

- (void)removeSubmodel:(T8BaseViewModel *)model
{
    if (model == nil) {
        return;
    }
    
    if ([_submodels containsObject:model]) {
        [model unbindView];
        [_submodels removeObject:model];
    }
}

- (void)drawInContext:(CGContextRef)context
{
    if (_modelFlags.skipDrawInContext || _hidden)
        return;
    
    [self drawSubmodelsInContext:context];
}

- (void)drawSubmodelsInContext:(CGContextRef)context
{
    for (T8BaseViewModel *submodel in self.submodels)
    {
        CGRect frame = submodel.frame;
        CGContextTranslateCTM(context, frame.origin.x, frame.origin.y);
        [submodel drawInContext:context];
        CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
    }
}

- (void)layoutForContainerSize:(CGSize) __unused containerSize
{
    
}

- (CGRect)bounds
{
    return CGRectMake(0, 0, _frame.size.width, _frame.size.height);
}

#pragma mark - setter
- (void)setFrame:(CGRect)frame
{
    _frame = frame;
    
    if (_view != nil)
        [_view setFrame:_frame];
}

- (void)setAlpha:(CGFloat)alpha
{
    _alpha = alpha;
    
    if (_view != nil)
        [_view setAlpha:alpha];
}

- (void)setHidden:(BOOL)hidden
{
    _hidden = hidden;
    
    if (_view != nil)
        [_view setHidden:hidden];
}

#pragma mark - getter
- (NSArray *)submodels
{
    return _submodels;
}

- (UIView *)boundView
{
    return _view;
}

@end

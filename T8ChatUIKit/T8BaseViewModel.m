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

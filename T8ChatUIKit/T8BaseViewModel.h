//
//  T8BaseViewModel.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/7.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface T8BaseViewModel : NSObject
{
    @private
    struct {
        int hasNoView : 1;
        int skipDrawInContext : 1;
        int disableSubmodelAutomaticBinding : 1;
        int viewUserInteractionDisabled : 1;
    } _modelFlags;
}

@property (nonatomic) CGRect frame;
@property (nonatomic) CGFloat alpha;
@property (nonatomic) BOOL hidden;

@property (nonatomic, strong, readonly) NSArray *submodels;

- (bool)hasNoView;
- (void)setHasNoView:(bool)hasNoView;

- (bool)skipDrawInContext;
- (void)setSkipDrawInContext:(bool)skipDrawInContext;

- (bool)disableSubmodelAutomaticBinding;
- (void)setDisableSubmodelAutomaticBinding:(bool)disableSubmodelAutomaticBinding;

- (bool)viewUserInteractionDisabled;
- (void)setViewUserInteractionDisabled:(bool)viewUserInteractionDisabled;

- (Class)viewClass;
- (UIView *)boundView;

- (void)bindViewToContainer:(UIView *)container;
- (void)unbindView;

- (void)addSubmodel:(T8BaseViewModel *)model;
- (void)removeSubmodel:(T8BaseViewModel *)model;
- (void)layoutForContainerSize:(CGSize)containerSize;

- (void)drawInContext:(CGContextRef)context;
- (void)drawSubmodelsInContext:(CGContextRef)context;

@end

//
//  T8ChatCollectionViewLayout.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/5.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ChatCollectionViewLayout.h"
#import "T8MessageItem.h"

@interface T8ChatCollectionViewLayout ()
{
    NSMutableArray *_layoutAttributes;
    CGSize _contentSize;
}

@end

@implementation T8ChatCollectionViewLayout

- (id)init
{
    self = [super init];
    if (self) {
        _layoutAttributes = [NSMutableArray array];
    }
    return self;
}

- (void)prepareLayout
{
    [_layoutAttributes removeAllObjects];
    
    NSArray *items = [((id<T8ChatCollectionViewLayoutDelegate>)self.collectionView.delegate) items];
    __block CGFloat contentHeight = 0.0f;
    CGSize containerSize = CGSizeMake(self.collectionView.bounds.size.width, 0);
    [items enumerateObjectsUsingBlock:^(T8MessageItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGSize msgSize = [obj sizeForContainerSize:containerSize];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
        attributes.frame = CGRectMake(0, contentHeight, msgSize.width, msgSize.height);
        [_layoutAttributes addObject:attributes];
        contentHeight += msgSize.height;
    }];
    
    _contentSize = CGSizeMake(self.collectionView.bounds.size.width, contentHeight);
}

- (CGSize)collectionViewContentSize
{
    return _contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = _layoutAttributes[indexPath.row];
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attributes in _layoutAttributes)
    {
        if ((CGRectIntersectsRect(rect, attributes.frame)))
            [array addObject:attributes];
    }
    
    return _layoutAttributes;
}

/**
 *  完善插入单条消息时的动画
 *
 *  @param itemIndexPath
 *
 *  @return
 */
- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];

    if (itemIndexPath.row == 0) {
        attr.center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMinY(self.collectionView.bounds));
        return attr;
    }
    
    return attr;
}



@end

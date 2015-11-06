//
//  T8ChatCollectionViewLayout.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/5.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ChatCollectionViewLayout.h"

@interface T8ChatCollectionViewLayout ()
{
    NSMutableArray *_layoutAttributes;
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
    if (_layoutAttributes.count == 0) {
        for (int i=0; i<30; i++) {
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            attributes.frame = CGRectMake(0, i*50, self.collectionView.bounds.size.width, 50);
            [_layoutAttributes addObject:attributes];
        }
    }
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.bounds.size.width, 1500);
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
        if (!CGRectIsNull(CGRectIntersection(rect, attributes.frame)))
            [array addObject:attributes];
    }
    
    return array;
}

@end

//
//  T8ChatCollectionViewLayout.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/5.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol T8ChatCollectionViewLayoutDelegate <UICollectionViewDataSource>

- (NSArray *)items;

@end

@interface T8ChatCollectionViewLayout : UICollectionViewLayout



@end

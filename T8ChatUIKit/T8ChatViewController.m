//
//  T8ChatViewController.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/5.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8ChatViewController.h"
#import "T8ChatCollectionView.h"
#import "T8ChatCollectionViewLayout.h"
#import "T8ChatBaseCollectionViewCell.h"
#import "T8MessageModel.h"
#import "T8MessageItem.h"

@interface T8ChatViewController () <T8ChatCollectionViewLayoutDelegate, UICollectionViewDelegate>
{
    T8ChatCollectionView *_collectionView;
    T8ChatCollectionViewLayout *_collectionLayout;
    
    NSMutableArray *_items;
}

@end

@implementation T8ChatViewController

- (id)init
{
    self = [super init];
    if (self) {
        
        //制作假数据
        _items = [NSMutableArray array];
        for (int i = 0; i < 1000; i++) {
            T8MessageModel *model = [[T8MessageModel alloc] init];
            if (i%2 == 0) {
                model.content = @"tuiaoweufaywgrawheiofjawirghawiufhawiuehfiauwhgauiwfheauyrgawiufhiuwahefauwhrguyawgefuyawgrhuahwufygwaruyfhawiuefhaiuwehfaiuwhguwayegfuyawgruyahfwiuehaiuwrhfauwehawuyefgauywrgauwfhauwirhgiuahfiuwehiuahgiugwauyagfuawhgiuawhfiu";
            }
            T8MessageItem *item = [[T8MessageItem alloc] initWithMessage:model];
            [_items addObject:item];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupCollectionView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setup
- (void)setupCollectionView
{
    _collectionLayout = [[T8ChatCollectionViewLayout alloc] init];
    _collectionView = [[T8ChatCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_collectionLayout];
    _collectionView.transform = CGAffineTransformMakeRotation(M_PI);
    _collectionView.backgroundColor = nil;
    _collectionView.opaque = false;
    _collectionView.scrollsToTop = false;
    _collectionView.delaysContentTouches = false;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [_collectionView registerClass:[T8ChatBaseCollectionViewCell class] forCellWithReuseIdentifier:@"chatCell"];
    
    [self.view insertSubview:_collectionView atIndex:1];
    
    UIEdgeInsets inset = _collectionView.contentInset;
    inset.top = 64;
    _collectionView.contentInset = inset;
    
    _collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 0, self.view.bounds.size.width - 7.5);
}

#pragma mark - UICollectionViewDataSource && T8ChatCollectionViewLayoutDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    T8MessageItem *item = _items[indexPath.row];
    
    __block T8ChatBaseCollectionViewCell *cell = nil;
    [UIView performWithoutAnimation:^{
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"chatCell" forIndexPath:indexPath];
        if (cell.boundItem != nil) {
            [cell.boundItem unbindCell];
        }
        [item bindCell:cell];
    }];

    
    
    return cell;
}

- (NSArray *)items
{
    return _items;
}

#pragma mark - UICollectionViewDelegate


@end

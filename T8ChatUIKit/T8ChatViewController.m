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
        for (int i = 0; i < 10; i++) {
            T8MessageModel *model = [[T8MessageModel alloc] init];
            T8MessageItem *item = [[T8MessageItem alloc] initWithMessage:model];
            [_items addObject:item];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"send" style:UIBarButtonItemStylePlain target:self action:@selector(sendPressed)];
    
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupCollectionView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendPressed
{
    T8MessageModel *model = [[T8MessageModel alloc] init];
    T8MessageItem *item = [[T8MessageItem alloc] initWithMessage:model];
    
    [self insertItems:@[item] insertType:T8MessageItemInsertTypeSend];
}

- (void)loadMoreHistoryMessage
{
    NSLog(@"loadMoreHistoryMessage...");
    
    NSMutableArray *msgs = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        T8MessageModel *model = [[T8MessageModel alloc] init];
        T8MessageItem *item = [[T8MessageItem alloc] initWithMessage:model];
        
        [msgs addObject:item];
    }
    
    [self insertItems:msgs insertType:T8MessageItemInsertTypeLoadMore];
}

- (void)insertItems:(NSArray *)items insertType:(T8MessageItemInsertType)insertType
{
    if (insertType == T8MessageItemInsertTypeSend || insertType == T8MessageItemInsertTypeRecieve) {
        [_items insertObject:items.firstObject atIndex:0];
        [_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:0 inSection:0]]];
    }else if (insertType == T8MessageItemInsertTypeLoadMore){
        [_items addObjectsFromArray:items];
        NSMutableArray *indexArray = [NSMutableArray array];
        [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSIndexPath *index = [NSIndexPath indexPathForItem:[_items indexOfObject:obj] inSection:0];
            [indexArray addObject:index];
        }];
        [_collectionView insertItemsAtIndexPaths:indexArray];
    }
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
            T8MessageItem *oldItem = cell.boundItem;
            [oldItem unbindCell];
        }
        if (item.boundCell != nil) {
            [item unbindCell];
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

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _collectionView) {
        /**
         *  提前loadmore
         */
        if (scrollView.contentOffset.y > scrollView.contentSize.height - 800 * 2.0f && scrollView.contentSize.height > FLT_EPSILON) {
            [self loadMoreHistoryMessage];
        }
    }
}

@end

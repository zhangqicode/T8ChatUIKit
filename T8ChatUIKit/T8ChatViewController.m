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

@interface T8ChatViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
{
    T8ChatCollectionView *_collectionView;
    T8ChatCollectionViewLayout *_collectionLayout;
}

@end

@implementation T8ChatViewController

- (id)init
{
    self = [super init];
    if (self) {
        
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

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    T8ChatBaseCollectionViewCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"chatCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate


@end

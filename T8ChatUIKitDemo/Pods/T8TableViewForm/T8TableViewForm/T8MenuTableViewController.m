//
//  UIMenuTableViewController.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/11.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTableViewController.h"
#import "T8MenuDescriptionCell.h"

@interface T8MenuTableViewController ()

@end

@implementation T8MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray *)menuSections
{
    if (!_menuSections) {
        _menuSections = [NSMutableArray array];
    }
    return _menuSections;
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.menuSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    T8MenuSection *menuSection = [self.menuSections objectAtIndex:section];
    NSMutableArray *sectionArr = menuSection.items;
    return sectionArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    T8MenuSection *section = [self.menuSections objectAtIndex:indexPath.section];
    NSMutableArray *sectionArr = section.items;
    T8MenuItem *item = [sectionArr objectAtIndex:indexPath.row];
    return [item itemHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    T8MenuSection *section = [self.menuSections objectAtIndex:indexPath.section];
    NSMutableArray *sectionArr = section.items;
    T8MenuItem *item = [sectionArr objectAtIndex:indexPath.row];
    item.delegate = self;
    T8MenuCell *cell = item.cell;
    if (indexPath.row==0) {
        if ([cell isMemberOfClass:[T8MenuDescriptionCell class]]) {
            if (sectionArr.count>1) {
                [cell showTopLine:NO bottomLine:YES];
            }else{
                [cell showTopLine:NO bottomLine:NO];
            }
        }else{
            [cell showTopLine:YES bottomLine:YES];
        }
    }else if (indexPath.row==sectionArr.count-1) {
        if ([cell isMemberOfClass:[T8MenuDescriptionCell class]]) {
            [cell showTopLine:NO bottomLine:NO];
        }else{
            [cell showTopLine:NO bottomLine:YES];
        }
    }else{
        [cell showTopLine:NO bottomLine:YES];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    T8MenuSection *menuSection = [self.menuSections objectAtIndex:section];
    return menuSection.sectionEdgeInsets.top;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    T8MenuSection *menuSection = [self.menuSections objectAtIndex:section];
    return menuSection.sectionEdgeInsets.bottom;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = [UIColor clearColor];
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - T8MenuItemDelegate
- (void)recieveMenuItemEvent:(NSString *)path item:(T8MenuItem *)item
{
    
}

@end

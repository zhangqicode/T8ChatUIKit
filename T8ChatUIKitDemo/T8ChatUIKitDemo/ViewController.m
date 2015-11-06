//
//  ViewController.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/5/29.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "ViewController.h"
#import "T8ChatViewController.h"

@interface ViewController ()<T8MenuItemDelegate>

@property (strong, nonatomic) T8MenuTitleItem *chatItem;
@property (strong, nonatomic) T8MenuSection *chatSection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"T8ChatUIKitDemo";
    
    self.chatItem = [[T8MenuTitleItem alloc] initWithTitle:@"对话" indicator:YES];
    self.chatSection = [[T8MenuSection alloc] init];
    self.chatSection.sectionEdgeInsets = UIEdgeInsetsMake(20, 0, 20, 0);
    [self.chatSection addMenuItem:self.chatItem];
    [self.menuSections addObject:self.chatSection];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - T8MenuItemDelegate
- (void)recieveMenuItemEvent:(NSString *)path item:(T8MenuItem *)item
{
    if ([path isEqualToString:T8MenuTitleItemTap]) {
        if (item == self.chatItem) {
            T8ChatViewController *chat = [[T8ChatViewController alloc] init];
            [self.navigationController pushViewController:chat animated:YES];
        }
    }
}

@end

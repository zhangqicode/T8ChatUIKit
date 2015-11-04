//
//  T8MenuDescriptionItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/23.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuDescriptionItem.h"
#import "T8MenuDescriptionCell.h"

@interface T8MenuDescriptionItem ()

@property (nonatomic) NSString *desc;

@end

@implementation T8MenuDescriptionItem

- (id)initWithDescription:(NSString *)description
{
    self = [super init];
    if (self) {
        self.desc = description;
        self.cell = [[T8MenuDescriptionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        ((T8MenuDescriptionCell *)self.cell).descriptionLabel.text = self.desc;
    }
    return self;
}

- (CGFloat)itemHeight
{
    CGSize stringSize = [self.desc boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, 9999) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:14] } context:nil].size;
    return stringSize.height + 30 + 1;
}

@end

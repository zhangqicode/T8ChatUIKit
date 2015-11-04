//
//  T8MenuTextViewItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/24.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTextViewItem.h"
#import "T8MenuTextViewCell.h"

@interface T8MenuTextViewItem ()

@property (nonatomic,assign) CGFloat cellHeight;

@end

@implementation T8MenuTextViewItem

- (id)initWithPlaceHolder:(NSString *)placeHolder andHeight:(CGFloat)height
{
    return [self initWithPlaceHolder:placeHolder andHeight:height initialValue:nil];
}

- (id)initWithPlaceHolder:(NSString *)placeHolder andHeight:(CGFloat)height initialValue:(NSString *)initialValue
{
    self = [super init];
    if (self) {
        self.cellHeight = height;
        self.cell = [[T8MenuTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        ((T8MenuTextViewCell *)self.cell).textView.placeHolder = placeHolder;
        ((T8MenuTextViewCell *)self.cell).textView.text = initialValue;
    }
    return self;
}

- (CGFloat)itemHeight
{
    return self.cellHeight;
}

- (NSString *)text
{
    return [((T8MenuTextViewCell *)self.cell).textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (void)setText:(NSString *)text
{
    ((T8MenuTextViewCell *)self.cell).textView.text = text;
}

@end

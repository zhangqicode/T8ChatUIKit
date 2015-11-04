//
//  T8MenuTextFieldItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/23.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTextFieldItem.h"
#import "T8MenuTextFieldCell.h"

@implementation T8MenuTextFieldItem

- (id)initWithPlaceHolder:(NSString *)placeHolder
{
    return [self initWithPlaceHolder:placeHolder initialValue:nil];
}

- (id)initWithPlaceHolder:(NSString *)placeHolder initialValue:(NSString *)initialValue
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        ((T8MenuTextFieldCell *)self.cell).textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHolder attributes:[NSDictionary dictionaryWithObject:[UIColor colorWithRed:160/255.0 green:169/255.0 blue:174/255.0 alpha:1] forKey:NSForegroundColorAttributeName]];
        ((T8MenuTextFieldCell *)self.cell).textField.text = initialValue;
    }
    return self;
}

- (CGFloat)itemHeight
{
    return 45;
}

- (NSString *)text
{
    return [((T8MenuTextFieldCell *)self.cell).textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (void)setText:(NSString *)text
{
    ((T8MenuTextFieldCell *)self.cell).textField.text = text;
}

@end

//
//  T8MessageModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/6.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageModel.h"

@implementation T8MessageModel

- (id)init
{
    self = [super init];
    if (self) {
        
        self.name = @"张琦";
        self.avatar = @"http://7xnjim.com1.z0.glb.clouddn.com/avatar/4cb918db-411f-44e8-b0ca-5e0851ff4f8c";
        self.type = 1 + rand()%2;
        self.content = @"why are you so diao?";
        self.incoming = rand()%2;
        
    }
    return self;
}

- (CGSize)sizeForContainerSize:(CGSize)containerSize
{
    if (self.type == 1) {
        return CGSizeMake(containerSize.width, 50);
    }
    return CGSizeZero;
}

@end

//
//  T8MessageModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/6.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageModel.h"

@interface T8MessageModel ()

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *avatar;
@property (strong, nonatomic) NSString *content;
@property (nonatomic) NSInteger type;
@property (nonatomic) BOOL incoming;

@end

@implementation T8MessageModel

- (id)init
{
    self = [super init];
    if (self) {
        
        self.name = @"张琦";
        self.avatar = @"http://7xnjim.com1.z0.glb.clouddn.com/avatar/c0dd782f-4d64-4254-acf0-0bb920af189c";
        self.type = 1 + rand()%4;
        if (rand()%2 == 1) {
            self.content = @"why are you so diao?";
        }else{
            self.content = @"tuiaoweufaywgrawheiofjawirghawiufhawiuehfiauwhgauiwfheauyrgawiufhiuwahefauwhrguyawgefuyawgrhuahwufygwaruyfhawiuefhaiuwehfaiuwhguwayegfuyawgruyahfwiuehaiuwrhfauwehawuyefgauywrgauwfhauwirhgiuahfiuwehiuahgiugwauyagfuawhgiuawhfiu";
        }
        self.incoming = rand()%2;
        
    }
    return self;
}

- (NSString *)t8_name
{
    return self.name;
}

- (NSString *)t8_avatar
{
    return self.avatar;
}

- (NSString *)t8_content
{
    return self.content;
}

- (t8_messageMediaType)t8_mediaType
{
    return self.type;
}

- (BOOL)t8_incoming
{
    return self.incoming;
}

@end

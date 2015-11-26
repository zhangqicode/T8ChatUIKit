//
//  T8Message.h
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/26.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    t8_messageMediaTypeText = 1,
    t8_messageMediaTypePhoto = 2,
    t8_messageMediaTypeChannelLink = 3,
    t8_messageMediaTypeSystem = 4
} t8_messageMediaType;

@protocol T8Message <NSObject>

- (NSString *)t8_name;
- (NSString *)t8_avatar;
- (NSString *)t8_content;
- (t8_messageMediaType)t8_mediaType;
- (BOOL)t8_incoming;

@end

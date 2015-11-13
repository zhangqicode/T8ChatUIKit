//
//  T8BubbleBgViewModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/13.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8BubbleBgViewModel.h"

#define T8TextMessageBackgroundImageDef(name, incoming, filePhone) \
    static UIImage *name() \
    { \
        static UIImage *image = nil; \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^ \
        { \
            image = [[UIImage imageNamed:filePhone] stretchableImageWithLeftCapWidth:incoming ? 25 : (40 - 25) topCapHeight:30]; \
        }); \
        return image; \
    }

T8TextMessageBackgroundImageDef(incomingImage, true, @"T8Chat_text_reciever_bubble")
T8TextMessageBackgroundImageDef(outgoingImage, false, @"T8Chat_text_sender_bubble")

@interface T8BubbleBgViewModel ()
{
    T8BubbleBgType _type;
}

@end

@implementation T8BubbleBgViewModel

- (id)initWithType:(T8BubbleBgType)type
{
    self = [super init];
    if (self) {
        
        _type = type;
        
    }
    return self;
}

- (void)bindViewToContainer:(UIView *)container
{
    [super bindViewToContainer:container];
    
    UIImageView *boundView = (UIImageView *)self.boundView;
    if (_type == T8BubbleBgTypeIncoming) {
        boundView.image = incomingImage();
    }else if (_type == T8BubbleBgTypeOutgoing){
        boundView.image = outgoingImage();
    }else{
        boundView.image = nil;
    }
}

@end

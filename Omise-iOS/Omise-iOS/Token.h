//
//  Token.h
//  Omise-iOS
//
//  Created on 2014/11/10.
//  Copyright (c) 2014年 Omise Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Token : NSObject

@property (nonatomic) NSString* cardId;
@property (nonatomic) BOOL livemode;
@property (nonatomic) NSString* location;
@property (nonatomic) BOOL used;
@property (nonatomic) Card* card;
@property (nonatomic) NSString* created;

@end

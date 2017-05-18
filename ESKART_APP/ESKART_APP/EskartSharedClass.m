//
//  EskartSharedClass.m
//  ESKART_APP
//
//  Created by Gaian on 5/17/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "EskartSharedClass.h"

@implementation EskartSharedClass


+ (EskartSharedClass *)sharedInstance
{
    static EskartSharedClass *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EskartSharedClass alloc] init];
        
    });
    return sharedInstance;
}
@end

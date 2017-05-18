//
//  EskartSharedClass.h
//  ESKART_APP
//
//  Created by Gaian on 5/17/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EskartSharedClass : NSObject

@property NSMutableArray  *array;
+ (EskartSharedClass *)sharedInstance;

@end

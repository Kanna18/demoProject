//
//  MainCellData.h
//  ESKART_APP
//
//  Created by Gaian on 5/14/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainCellData : NSObject



@property NSString *cat_id;
@property NSString *image_url;
@property NSString *name;
-(instancetype)initWithDictionary:(NSDictionary*)dict;
@end


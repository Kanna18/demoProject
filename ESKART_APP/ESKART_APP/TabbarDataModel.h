//
//  TabbarDataModel.h
//  ESKART_APP
//
//  Created by Gaian on 5/15/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductCellDataModel.h"

@interface TabbarDataModel : NSObject
@property NSString *sub_cat_id;
@property NSString *name;

@property (nonatomic,strong) NSMutableArray *listArray;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end

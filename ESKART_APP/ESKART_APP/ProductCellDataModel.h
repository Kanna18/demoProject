//
//  ProductCellDataModel.h
//  ESKART_APP
//
//  Created by Gaian on 5/15/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCellDataModel : NSObject


-(instancetype)initWithDictionary:(NSDictionary *)dict;

@property NSString *product_id;
@property NSString *vendor_id;
@property NSString *product_name;
@property NSString *price;
@property NSString *regular_price;
@property NSString *stock;
@property NSString *image;
@property NSString *vendor_name;
@property NSString *rating;


@end

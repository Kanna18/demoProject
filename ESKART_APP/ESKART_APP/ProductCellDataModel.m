//
//  ProductCellDataModel.m
//  ESKART_APP
//
//  Created by Gaian on 5/15/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "ProductCellDataModel.h"

@implementation ProductCellDataModel

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    self=[super init];
    if(self)
    {
        @try {
            _product_id=dict[@"product_id"];
            _vendor_id=dict[@"vendor_id"];
            _product_name=dict[@"product_name"];
            _price=dict[@"price"];
            _regular_price=dict[@"regular_price"];
            _stock=dict[@"stock"];
            _image=dict[@"image"];
            _vendor_name=dict[@"vendor_name"];
            _rating=dict[@"rating"];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
    }
    return self;
}
@end

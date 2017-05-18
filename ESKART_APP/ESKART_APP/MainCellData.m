//
//  MainCellData.m
//  ESKART_APP
//
//  Created by Gaian on 5/14/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "MainCellData.h"

@implementation MainCellData



-(instancetype)initWithDictionary:(NSDictionary*)dict
{
    self=[super init];
    if(self)
 {
    @try {
        _cat_id=dict[@"cat_id"];
        _image_url=dict[@"image_url"];
        _name=dict[@"name"];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
 }
    return self;
}
@end

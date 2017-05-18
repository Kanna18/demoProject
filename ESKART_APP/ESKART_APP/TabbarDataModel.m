//
//  TabbarDataModel.m
//  ESKART_APP
//
//  Created by Gaian on 5/15/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "TabbarDataModel.h"

@implementation TabbarDataModel
{
    NSMutableArray *list;
}
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self=[super init])
    {
        @try {
            
            _sub_cat_id=dict[@"sub_cat_id"];
            _name=dict[@"name"];
    
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
     
    }
    return self;
}
@end

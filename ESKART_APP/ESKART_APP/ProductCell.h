//
//  ProductCell.h
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountView.h"
#import "ProductCellDataModel.h"

@interface ProductCell : UITableViewCell

@property ProductCellDataModel *cellInfo;


@property   UIImageView *productImg;
@property   UILabel *productName;
@property   UILabel *productPrice;
@property   UILabel *productDiscount;

-(void)bindDataforCell:(ProductCellDataModel*)data;


@end

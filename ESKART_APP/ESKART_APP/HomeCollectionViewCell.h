//
//  HomeCollectionViewCell.h
//  ESKART_APP
//
//  Created by Gaian on 4/26/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCellData.h"
@interface HomeCollectionViewCell : UICollectionViewCell

@property UIImageView *imageView;
@property UILabel *titleLabel;
@property MainCellData *cellData;
-(instancetype)initWithFrame:(CGRect)frame;

-(void)bindCellData:(MainCellData*)cellInfo;
@end

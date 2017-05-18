//
//  OffersCollectionViewCell.h
//  ESKART_APP
//
//  Created by Gaian on 5/4/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffersCollectionViewCell : UICollectionViewCell


@property UIImageView *imageView;
@property UILabel *titleLabel;
@property UILabel *subTitleLabel;
@property UILabel *rateLabel;


-(instancetype)initWithFrame:(CGRect)frame;

@end

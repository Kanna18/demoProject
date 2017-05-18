//
//  OffersCollectionViewCell.m
//  ESKART_APP
//
//  Created by Gaian on 5/4/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "OffersCollectionViewCell.h"

@implementation OffersCollectionViewCell{
    
    CGFloat cell_width,cell_height;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    
    if(self)
    {
        self.contentView.backgroundColor=[UIColor whiteColor];
        cell_height=frame.size.height;
        cell_width=frame.size.width;
        
        self.layer.borderColor=[[[UIColor blackColor] colorWithAlphaComponent:0.2]CGColor];
        self.layer.borderWidth=1.0f;
        [self cellContainerViewComponents];
        
    }
    return self;
    
    
}
-(void)cellContainerViewComponents
{
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(cell_width/2-cell_height/4, 2, cell_height/2, cell_height/2)];
    _imageView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self.contentView addSubview:_imageView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,cell_height/2+2, cell_width, cell_height/6)];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.textColor=[UIColor blackColor];
    _titleLabel.text=@"ItemName";
    _titleLabel.textAlignment=NSTextAlignmentCenter;
    
    
    _subTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,cell_height/2+2+cell_height/6, cell_width,cell_height/6)];
    [self.contentView addSubview:_subTitleLabel];
    _subTitleLabel.textColor=[UIColor greenColor];
    _subTitleLabel.text=@"SubTitle";
    _subTitleLabel.textAlignment=NSTextAlignmentCenter;
    
    _rateLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,cell_height/2+2+cell_height/3, cell_width, cell_height/6)];
    [self.contentView addSubview:_rateLabel];
    _rateLabel.textColor=[UIColor blackColor];
    _rateLabel.text=@"$ 200.00";
    _rateLabel.textAlignment=NSTextAlignmentCenter;
    
}


@end

//
//  ProductCell.m
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "ProductCell.h"

@implementation ProductCell{
    
    CountView *countView;
    CGFloat cell_width,cell_height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    cell_width=self.frame.size.width;
    cell_height=self.frame.size.height;
    countView=[[CountView alloc]initWithFrame:CGRectMake(cell_width-150, 50, 150, 50)];//224:80
    [self.contentView addSubview:countView];
    

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        cell_width=self.frame.size.width;
        cell_height=100;
        
        [self cellComponents];
        
    }
    return  self;
}

-(void)cellComponents
{
    _productImg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell_width/3, cell_height)];
    [self.contentView addSubview:_productImg];
    
    
    _productName=[[UILabel alloc]initWithFrame:CGRectMake(cell_width/3, 0, cell_width/2, 30)];
    [self.contentView addSubview:_productName];
    
    
    _productPrice=[[UILabel alloc]initWithFrame:CGRectMake(cell_width/3, 30, cell_width/2, 30)];
    [self.contentView addSubview:_productPrice];
 
    
    _productDiscount=[[UILabel alloc]initWithFrame:CGRectMake(cell_width/3, 60, cell_width/2, 30)];
    [self.contentView addSubview:_productDiscount];
    
}

-(void)bindDataforCell:(ProductCellDataModel*)data
{
    _cellInfo=data;
    
    _productImg.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_cellInfo.image]]];
    _productName.text=_cellInfo.product_name;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

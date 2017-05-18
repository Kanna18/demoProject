//
//  HomeCollectionViewCell.m
//  ESKART_APP
//
//  Created by Gaian on 4/26/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell
{
    
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
        
        [self cellContainerViewComponents];
    
    }
    return self;
    
}
-(void)cellContainerViewComponents
{
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell_width, cell_height)];
    _imageView.backgroundColor=[UIColor brownColor];
    [self.contentView addSubview:_imageView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,cell_height-40 , cell_width, 40)];
    [self.contentView addSubview:_titleLabel];
    _titleLabel.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.2];
    _titleLabel.textColor=[UIColor whiteColor];
    _titleLabel.text=@"product";
    _titleLabel.textAlignment=NSTextAlignmentCenter;
}
-(void)bindCellData:(MainCellData *)cellInfo
{
    _cellData=cellInfo;
    
    _imageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_cellData.image_url]]];
    _titleLabel.text=_cellData.name;
    
}
@end

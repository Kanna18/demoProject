//
//  ProfileTableViewCell.m
//  ESKART_APP
//
//  Created by Gaian on 5/3/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell{
    
    CGFloat cell_width,cell_height;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        cell_width=self.frame.size.width;
        cell_height=200;
        
        [self cellContentViewComponents];
    }
    return self;
    
}
-(void)cellContentViewComponents
{
    _Img_profileBkgnd=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell_width, cell_height)];
    [self.contentView addSubview:_Img_profileBkgnd];
    
    _img_UserPic=[[UIImageView alloc]initWithFrame:CGRectMake(0,cell_height/2-25, 50, 50)];
    _img_UserPic.image=[UIImage imageNamed:@"profile"];
    [self.contentView addSubview:_img_UserPic];
    
    _lbl_userName=[[UILabel alloc]initWithFrame:CGRectMake(60,cell_height/2-20, cell_width-60, 40)];
    _lbl_userName.text=@"Dinesh Kumar";
    _lbl_userName.textColor=[UIColor whiteColor];
    [self.contentView addSubview:_lbl_userName];
    [_lbl_userName setFont:[UIFont boldSystemFontOfSize:20.0]];
    [_lbl_userName setAdjustsFontSizeToFitWidth:YES];
    
    
}
@end

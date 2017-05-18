//
//  CustomNavigationBar.m
//  ESKART_APP
//
//  Created by Gaian on 4/23/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar{
    
    CGFloat bar_width,bar_height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self=[[NSBundle mainBundle] loadNibNamed:@"CustomNavigationBar" owner:self options:nil][0];
        self.frame=frame;
        
        bar_width=frame.size.width;
        bar_height=frame.size.height;
        
        
        [_titleLable setAdjustsFontSizeToFitWidth:YES];
        self.cartLabel.layer.cornerRadius=self.cartLabel.frame.size.height/2;
        self.cartLabel.clipsToBounds=YES;
        
        self.favouritesLable.layer.cornerRadius=self.cartLabel.frame.size.height/2;
        self.favouritesLable.clipsToBounds=YES;
    }
    return self;
    
}


- (IBAction)menuButtonClick:(id)sender {
    
    [self.delegates menuButtonClicked];
}
- (IBAction)favouritesImageClick:(id)sender {
}
@end

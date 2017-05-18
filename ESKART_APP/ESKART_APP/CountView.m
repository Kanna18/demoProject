//
//  CountView.m
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "CountView.h"

@implementation CountView

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
        self=[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil][0];
        
        self.frame=frame;
    }
    return self;
    
}
- (IBAction)decrementorClick:(id)sender {
    int val=_countLabel.text.intValue;
    if(val>0)
    {
        val--;
        _countLabel.text=[NSString stringWithFormat:@"%d",val];
        
    }
}

- (IBAction)incrementorClick:(id)sender {
    
    int val=_countLabel.text.intValue;
    if(!(val<0))
    {
        val++;
        _countLabel.text=[NSString stringWithFormat:@"%d",val];
        
    }
}
@end

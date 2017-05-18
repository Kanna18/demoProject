//
//  CountView.h
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountView : UIView
- (IBAction)decrementorClick:(id)sender;
- (IBAction)incrementorClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

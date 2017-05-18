//
//  CustomNavigationBar.h
//  ESKART_APP
//
//  Created by Gaian on 4/23/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomNavigatonDelegates <NSObject>

-(void)menuButtonClicked;

@end

@interface CustomNavigationBar : UIView

@property (weak, nonatomic) id<CustomNavigatonDelegates>delegates;

@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *cartLabel;
@property (weak, nonatomic) IBOutlet UILabel *favouritesLable;
- (IBAction)menuButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *cartImageClick;
- (IBAction)favouritesImageClick:(id)sender;

@end

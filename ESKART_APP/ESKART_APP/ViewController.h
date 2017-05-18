//
//  ViewController.h
//  ESKART
//
//  Created by Gaian on 4/13/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KYDrawerController.h>
#import "MainCollectionViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image_Vw;
@property (weak, nonatomic) IBOutlet UITextField *email_Tf;

@property (weak, nonatomic) IBOutlet UITextField *paswrd_Tf;
@property (weak, nonatomic) IBOutlet UIButton *usr_signIn;
@property (weak, nonatomic) IBOutlet UIButton *facebook_SignIn;
@property (weak, nonatomic) IBOutlet UIButton *google_SignIn;
@property (weak, nonatomic) IBOutlet UIButton *forgot_pwd;
@property (weak, nonatomic) IBOutlet UIButton *nwUsr_signIn;


- (IBAction)signInClick:(id)sender;
- (IBAction)faceBookLoginClick:(id)sender;
- (IBAction)googleSignInClick:(id)sender;
- (IBAction)forgotPasswordClick:(id)sender;
- (IBAction)newUserSignUpClick:(id)sender;



@end


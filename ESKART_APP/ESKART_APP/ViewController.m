//
//  ViewController.m
//  ESKART
//
//  Created by Gaian on 4/13/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController{
    
    CGFloat scr_wdth,scr_hgt;
    
    KYDrawerController *drawerController;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scr_wdth=[UIScreen mainScreen].bounds.size.width;
    scr_hgt=[UIScreen mainScreen].bounds.size.height;
    
    [self ComponentsAdjustmentsFunction];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ComponentsAdjustmentsFunction
{
    _email_Tf.leftViewMode=UITextFieldViewModeAlways;
    _email_Tf.leftView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"email"]];
    
    _paswrd_Tf.leftViewMode=UITextFieldViewModeAlways;
    _paswrd_Tf.leftView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"password"]];
    
    _image_Vw.image=[UIImage imageNamed:@"cric.jpg"];
    
    [_nwUsr_signIn.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [_forgot_pwd.titleLabel setAdjustsFontSizeToFitWidth:YES];
    
    
    _usr_signIn.layer.cornerRadius=10;
    _nwUsr_signIn.layer.cornerRadius=10;
    _google_SignIn.layer.cornerRadius=10;
    _facebook_SignIn.layer.cornerRadius=10;
    
    _google_SignIn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, _google_SignIn.frame.size.width-100);
    _facebook_SignIn.imageEdgeInsets=UIEdgeInsetsMake(0, 0, 0, _google_SignIn.frame.size.width-100);
    
    _paswrd_Tf.delegate=self;
    _email_Tf.delegate=self;
    

    
}


#pragma mark TextField Delegates
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)signInClick:(id)sender {
        
    drawerController=[self.storyboard instantiateViewControllerWithIdentifier:@"drawerCont"];
    [self presentViewController:drawerController animated:YES completion:nil];
    
    firstLogin=YES;
    
}

- (IBAction)faceBookLoginClick:(id)sender {
}

- (IBAction)googleSignInClick:(id)sender {
}

- (IBAction)forgotPasswordClick:(id)sender {
}

- (IBAction)newUserSignUpClick:(id)sender {
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
}
@end

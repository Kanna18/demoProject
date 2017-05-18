//
//  MyAccountViewController.m
//  ESKART_APP
//
//  Created by Gaian on 5/4/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()

@end

@implementation MyAccountViewController{
    
    UIScrollView *scrllVw;
    UITextField *textflds;
    UIButton *update_Prfle;
    
    CGFloat scr_wdth,scr_hgt;
    
    CustomNavigationBar *customNavigation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    scr_wdth=[[UIScreen mainScreen]bounds].size.width;
    scr_hgt=[[UIScreen mainScreen]bounds].size.height;
    
    
    [self mainViewComponents];
    [self loadCustomNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mainViewComponents
{
    scrllVw=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, scr_wdth, scr_hgt-scr_hgt/9)];
    scrllVw.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:scrllVw];
    
    update_Prfle=[UIButton buttonWithType:UIButtonTypeCustom];
    update_Prfle.frame=CGRectMake(0, scr_hgt-scr_hgt/9, scr_wdth, scr_hgt/9);
    [update_Prfle setBackgroundColor:[[UIColor orangeColor] colorWithAlphaComponent:0.7]];
    [update_Prfle setTitle:@"UPDATE PROFILE" forState:UIControlStateNormal];
    [self.view addSubview:update_Prfle];
    
    int x=15,y=15;
    for (int i=0; i<9;i++)
    {
        textflds=[[UITextField alloc]initWithFrame:CGRectMake(x,y,scr_wdth-30,scr_hgt/9)];
        textflds.backgroundColor=[UIColor whiteColor];
        textflds.layer.cornerRadius=10.0f;
        textflds.clipsToBounds=YES;
        [scrllVw addSubview:textflds];
        y+=scr_hgt/9+10;
    }
    scrllVw.contentSize=CGSizeMake(scr_wdth, y);
    
}

-(void)loadCustomNavigation
{
    customNavigation=[[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, scr_wdth, 44)];
    customNavigation.titleLable.text=@"My Account";
    customNavigation.delegates=self;
    [self.navigationController.navigationBar addSubview:customNavigation];
    
}
#pragma mark customNavigationBarDelegates

-(void)menuButtonClicked
{
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}
@end

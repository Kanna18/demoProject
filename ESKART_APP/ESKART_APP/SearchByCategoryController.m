//
//  SearchByCategoryController.m
//  ESKART_APP
//
//  Created by Gaian on 5/4/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "SearchByCategoryController.h"

@interface SearchByCategoryController ()

@end

@implementation SearchByCategoryController{
    
    CustomNavigationBar *customNavigation;
    CGFloat scr_width,scr_height;
    
    NSDictionary *tvData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scr_width=[[UIScreen mainScreen] bounds].size.width;
    scr_height=[[UIScreen mainScreen] bounds].size.height;
    
    
    tvData=@{@"titles":@[@"Breakfast & Dairy",@"Dairy",@"Breakfast",@"Breakfast",@"Breakfast & Dairy"],@"thumbnails":@[@"cartThumbnail",@"cartThumbnail",@"cartThumbnail",@"cartThumbnail",@"cartThumbnail"]};
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[tvData objectForKey:@"titles"] count];
}
-(void)loadCustomNavigation
{
    customNavigation=[[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, scr_width, 44)];
    customNavigation.titleLable.text=@"Search By Category";
    customNavigation.delegates=self;
    [self.navigationController.navigationBar addSubview:customNavigation];
    
}
#pragma mark customNavigationBarDelegates

-(void)menuButtonClicked
{
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuse=@"seaarchCategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse forIndexPath:indexPath];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }

    cell.textLabel.text=[tvData objectForKey:@"titles"][indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[tvData objectForKey:@"thumbnails"][indexPath.row]];
    cell.accessoryView = [[ UIImageView alloc ]
                            initWithImage:[UIImage imageNamed:@"arrowAccessory" ]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];

    CategoryListTableController *categoryList=[self.storyboard instantiateViewControllerWithIdentifier:@"catogoryListVC"];
    
    customNavigation.menuButton.hidden=YES;
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    button.frame=customNavigation.menuButton.frame;
    [customNavigation addSubview:button];
    button.tintColor=[UIColor whiteColor];
    [button setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
    [button addTarget:categoryList action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController pushViewController:categoryList animated:YES];
    customNavigation.titleLable.text=cell.textLabel.text;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self loadCustomNavigation];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
}
@end

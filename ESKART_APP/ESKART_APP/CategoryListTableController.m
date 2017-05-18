//
//  CategoryListTableController.m
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "CategoryListTableController.h"

@interface CategoryListTableController ()

@end

@implementation CategoryListTableController{

CustomNavigationBar *customNavigation;
CGFloat scr_width,scr_height;

NSDictionary *tvData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scr_width=[[UIScreen mainScreen] bounds].size.width;
    scr_height=[[UIScreen mainScreen] bounds].size.height;
        
    tvData=@{@"titles":@[@"Breakfast & Dairy",@"Dairy",@"Breakfast",@"Breakfast"],@"thumbnails":@[@"cartThumbnail",@"cartThumbnail",@"cartThumbnail",@"cartThumbnail"]};
    self.navigationItem.hidesBackButton = YES;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[tvData objectForKey:@"titles"] count];
}

-(void)backButtonClicked:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark customNavigationBarDelegates

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuse=@"seaarchCategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse forIndexPath:indexPath];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    
    cell.textLabel.text=[tvData objectForKey:@"titles"][indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[tvData objectForKey:@"thumbnails"][indexPath.row]];
    cell.accessoryView = [[ UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrowAccessory"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

@end

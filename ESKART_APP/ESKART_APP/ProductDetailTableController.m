//
//  ProductDetailTableController.m
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "ProductDetailTableController.h"

@interface ProductDetailTableController ()

@end

@implementation ProductDetailTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
        self.navigationItem.hidesBackButton = YES;
    
    UISwipeGestureRecognizer *gesture = [[UISwipeGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(handleSwipeFrom:)];
    [gesture setDirection:
     (UISwipeGestureRecognizerDirectionLeft
      |UISwipeGestureRecognizerDirectionRight)];
    [self.tableView addGestureRecognizer:gesture];
    

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

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuse=@"productdetailCell";
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse  forIndexPath:indexPath];
    
    if(cell==nil)
    {
        cell=[[ProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    cell.productImg.image=[UIImage imageNamed:[[NSBundle mainBundle]pathForResource:@"demo3" ofType:@"jpg"]];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 50;
}




@end

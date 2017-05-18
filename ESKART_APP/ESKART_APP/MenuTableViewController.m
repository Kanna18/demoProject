//
//  TableViewController.m
//  ESKART_APP
//
//  Created by Gaian on 4/23/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "MenuTableViewController.h"
#import "ProfileTableViewCell.h"

@interface MenuTableViewController ()

@end


@implementation MenuTableViewController{
    
    NSArray *section1,*section2;
    
    NSDictionary *menuItems;
    CGFloat scr_width,scr_height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    scr_width=[[UIScreen mainScreen] bounds].size.width;
    scr_height=[[UIScreen mainScreen] bounds].size.height;
    
    menuItems=@{
                @"section1":
  @[@"Home",@"Search By Category",@"Offers",@"My Cart",@"My Wishlist",@"My Orders",@"My Account"],
                @"section2":
  @[@"Other",@"Rate the App",@"Help",@"Share",@"Logout"],
                @"images1":
@[@"myHome",@"mySearch",@"myOffers",@"myCart",@"myWishlist",@"myOrders",@"myAccount"]};
    
    self.navigationController.navigationBar.hidden=YES;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[ProfileTableViewCell class] forCellReuseIdentifier:@"profileCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return [[menuItems objectForKey:@"section1"] count];
            break;
        case 2:
            return [[menuItems objectForKey:@"section2"] count];
            break;
        default:
            break;
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section)
    {
        case 0:{
            static NSString * const reuseIdentifier = @"profileCell";
            ProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            if(cell==nil)
            {
                cell=[[ProfileTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            }
            cell.Img_profileBkgnd.image=[UIImage imageNamed:@"ProfileBackground"];
            return cell;
        }
            break;
            
        case 1:{
        static NSString * const reuseIdentifier = @"section1";
          UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
            if(cell==nil)
            {
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
            }
            cell.textLabel.text=[menuItems objectForKey:@"section1"][indexPath.row];
            cell.imageView.image=[UIImage imageNamed:[menuItems objectForKey:@"images1"][indexPath.row]];
            return cell;
        }
            
            break;
            
        case 2:{
            static NSString * const reuseIdentifier = @"section2";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
                if(cell==nil)
                {
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
                }
            cell.textLabel.text=[menuItems objectForKey:@"section2"][indexPath.row];
            cell.imageView.image=[UIImage imageNamed:[menuItems objectForKey:@"images2"][indexPath.row]];
            return cell;
            }
            
            
            break;
            
        default:
            break;
    }
    
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    
    if([cell.textLabel.text isEqualToString:@"Home"])
    {
        MainCollectionViewController *mainVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainVc"];
        
        UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:mainVC];
        elDrawer.mainViewController=navController;
        [elDrawer setDrawerState:KYDrawerControllerDrawerStateClosed animated:YES];
    }

    if([cell.textLabel.text isEqualToString:@"Offers"])
    {
        OffersProductController *mainVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"offersVC"];
        
        UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:mainVC];        
        elDrawer.mainViewController=navController;
        [elDrawer setDrawerState:KYDrawerControllerDrawerStateClosed animated:YES];
    }
    if([cell.textLabel.text isEqualToString:@"My Account"])
    {
        MyAccountViewController *mainVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"myAccountVC"];
        
        UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:mainVC];
    
        elDrawer.mainViewController=navController;
        [elDrawer setDrawerState:KYDrawerControllerDrawerStateClosed animated:YES];
    }
    
    if([cell.textLabel.text isEqualToString:@"Search By Category"])
    {
        MyAccountViewController *mainVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"searcVC"];
        
        UINavigationController *navController=[[UINavigationController alloc]initWithRootViewController:mainVC];
        
        elDrawer.mainViewController=navController;
        [elDrawer setDrawerState:KYDrawerControllerDrawerStateClosed animated:YES];
    }

    
    
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return 200;
            break;
            
        default:
            break;
    }
    
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 2;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

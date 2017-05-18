
//
//  MainCollectionViewController.m
//  ESKART_APP
//
//  Created by Gaian on 4/23/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "MainCollectionViewController.h"
@interface MainCollectionViewController ()

@end



@implementation MainCollectionViewController{
    
    CustomNavigationBar *customNavigation;
    CGFloat scr_width,scr_height;
    
    ServerAPIManager *serverAPI;
    NSMutableArray *collectionViewdata;
    
    
}
static NSString * const HomereuseIdentifier = @"Cell";
//static NSString * const OfferreuseIdentifier = @"Offer";

BOOL firstLogin=0/1;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scr_width=[[UIScreen mainScreen] bounds].size.width;
    scr_height=[[UIScreen mainScreen] bounds].size.height;
    
    serverAPI=[ServerAPIManager sharedinstance];
 
        [self.collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:HomereuseIdentifier];
        firstLogin=NO;
    
    
    serverAPI=[ServerAPIManager sharedinstance];
    
    [serverAPI processRequest:@"categories.php" params:nil requestType:@"GET" successBlock:^(id responseObj) {
        
        NSArray *array=[NSJSONSerialization JSONObjectWithData:responseObj options:0 error:nil];
        [self dataModel:array];
    } andErrorBlock:^(NSError *error) {
        
        
    } ];
}
-(void)dataModel:(NSArray*)array
{
    collectionViewdata=[[NSMutableArray alloc]init];
    for (NSDictionary *tempDict in array)
    {
        MainCellData *mainCellData=[[MainCellData alloc]initWithDictionary:tempDict];
        [collectionViewdata addObject:mainCellData];
    }
    
    [self.collectionView reloadData];
}
-(void)loadCustomNavigation
{
    customNavigation=[[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, scr_width, 44)];
    customNavigation.delegates=self;
    [self.navigationController.navigationBar addSubview:customNavigation];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark customNavigationBarDelegates

-(void)menuButtonClicked
{
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return collectionViewdata.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomereuseIdentifier forIndexPath:indexPath];
        [cell bindCellData:collectionViewdata[indexPath.row]];
//        cell.imageView.image=[UIImage imageNamed:[[NSBundle mainBundle]pathForResource:@"demoImg" ofType:@"jpg"]];
    
        return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenheight = screenRect.size.height;
    
    float cellWidth = screenWidth / 2-5; //Replace the divisor with the column count requirement. Make sure to have it in float.
    CGSize size = CGSizeMake(cellWidth, screenheight/3);
    
    
    
    return size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomeCollectionViewCell *cell=(HomeCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    [serverAPI processRequest:@"subcategories.php" params:@{@"cat_id":cell.cellData.cat_id} requestType:@"GET" successBlock:^(id responseObj) {
        
        NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObj options:0 error:nil];
        [self handleJsonResponse:arr andCell:cell];
        
    } andErrorBlock:^(NSError *error) {
        
        
    }];
    

}
-(void)handleJsonResponse:(NSArray *)arr andCell:(HomeCollectionViewCell*)cell
{
    NSMutableArray *categoriesarray=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in arr)
    {
        TabbarDataModel *tabData=[[TabbarDataModel alloc] initWithDictionary:dict];
        
        [serverAPI processRequest:@"category_products.php" params:@{@"cat_id":tabData.sub_cat_id} requestType:@"GET" successBlock:^(id responseObj) {
            
            NSArray *arr=[NSJSONSerialization JSONObjectWithData:responseObj options:0 error:nil];
            int index=0;
            NSMutableArray *listArr=[[NSMutableArray alloc]init];
            for (NSDictionary *dict in arr) {
                ProductCellDataModel *data=[[ProductCellDataModel alloc]initWithDictionary:dict];
                [listArr addObject:data];
                index++;
                if(index==arr.count)
                {
                    tabData.listArray=listArr;
                    [categoriesarray addObject:tabData];
                    NSLog(@"=----%@",categoriesarray);
                    [EskartSharedClass sharedInstance].array=categoriesarray;
                    ProductDetail *tableVc=[self.storyboard instantiateViewControllerWithIdentifier:@"NewProductDetail"];
                    [self.navigationController pushViewController:tableVc animated:YES];
                    customNavigation.menuButton.hidden=YES;
                    customNavigation.titleLable.text=cell.titleLabel.text;
                    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
                    button.frame=customNavigation.menuButton.frame;
                    [customNavigation addSubview:button];
                    button.tintColor=[UIColor whiteColor];
                    [button setImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
                    [button addTarget:tableVc action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                    

                }
            }
    
        } andErrorBlock:^(NSError *error) {
            
    
        }];
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self loadCustomNavigation];
}
#pragma mark <UICollectionViewDelegate>
@end

//
//  OffersProductController.m
//  ESKART_APP
//
//  Created by Gaian on 5/5/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "OffersProductController.h"

@interface OffersProductController ()

@end

@implementation OffersProductController{
    
    CustomNavigationBar  *customNavigation;
    CGFloat scr_width,scr_height;
}

static NSString * const OfferreuseIdentifier = @"Offer";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scr_height=[[UIScreen mainScreen] bounds].size.height;
    scr_width=[[UIScreen mainScreen] bounds].size.width;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[OffersCollectionViewCell class] forCellWithReuseIdentifier:OfferreuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    OffersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:OfferreuseIdentifier forIndexPath:indexPath];
    cell.imageView.image=[UIImage imageNamed:[[NSBundle mainBundle]pathForResource:@"demo2" ofType:@"jpg"]];
    
    
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
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self loadCustomNavigation];
}
-(void)loadCustomNavigation
{
    customNavigation=[[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, scr_width, 44)];
    customNavigation.delegates=self;
    customNavigation.titleLable.text=@"Offers";
    [self.navigationController.navigationBar addSubview:customNavigation];
    
}
#pragma mark customNavigationBarDelegates

-(void)menuButtonClicked
{
    KYDrawerController *elDrawer = (KYDrawerController*)self.navigationController.parentViewController;
    [elDrawer setDrawerState:KYDrawerControllerDrawerStateOpened animated:YES];
}
@end

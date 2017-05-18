//
//  ViewController.m
//  GLViewPagerViewController
//
//  Created by Yanci on 17/4/18.
//  Copyright © 2017年 Yanci. All rights reserved.
//

#import "ProductDetail.h"

@interface GLPresentViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (id)initWithArray:(NSArray *)tvDataArray;
@end


@interface GLPresentViewController()
@property (nonatomic,strong)UILabel *presentLabel;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation GLPresentViewController {
    BOOL _setupSubViews;
    NSArray *tvData;
}

- (id)initWithArray:(NSArray *)tvDataArray {
    if (self = [super init]) {
        
        tvData=tvDataArray;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _tableView=[[UITableView alloc]initWithFrame:[[UIScreen mainScreen]bounds] style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    
    [_tableView registerClass:[ProductCell class] forCellReuseIdentifier:@"productdetailCell"];

}

- (void)viewWillLayoutSubviews {
        self.presentLabel.center = self.view.center;
}

- (UILabel *)presentLabel {
    if (!_presentLabel) {
        _presentLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    }
    return _presentLabel;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return tvData.count;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse=@"productdetailCell";
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse  forIndexPath:indexPath];
    
    if(cell==nil)
    {
        cell=[[ProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }

    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}

-(void)backButtonClicked:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}




@end



@interface ProductDetail ()<GLViewPagerViewControllerDataSource,GLViewPagerViewControllerDelegate>

@property (nonatomic,strong)NSMutableArray *viewControllersArray;
//@property (nonatomic,strong)NSArray *tabTitles;
@end

@implementation ProductDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationItem.title = @"Not Hiding";
    self.navigationItem.hidesBackButton=YES;

    // Do any additional setup after loading the view.
    self.dataSource = self;
    self.delegate = self;
    self.fixTabWidth = NO;
    self.padding = 10;
    self.leadingPadding = 10;
    self.trailingPadding = 10;
    self.defaultDisplayPageIndex = 0;
    self.tabAnimationType = GLTabAnimationType_whileScrolling;
    self.indicatorColor = [UIColor colorWithRed:255.0/255.0 green:205.0 / 255.0 blue:0.0 alpha:1.0];
    
    
    self.viewControllersArray =[EskartSharedClass sharedInstance].array;

//    self.viewControllersArray=[[NSMutableArray alloc]init];
    for (int i=0; i<self.viewControllersArray.count; i++)
    {
        [self.viewControllersArray addObject:[[GLPresentViewController alloc]initWithArray:@[@"First One"]]];
    }
    
    
}
-(void)getResponseFromSubCategory
{
    ServerAPIManager *serverAPI= [ServerAPIManager sharedinstance];
    [serverAPI processRequest:@"subcategories.php" params:@{@"cat_id":@"34"} requestType:@"GET" successBlock:^(id responseObj) {
    
        NSArray *array=[NSJSONSerialization JSONObjectWithData:responseObj options:0 error:nil];
        _categoriesArray=array;
        self.viewControllersArray=[[NSMutableArray alloc]init];
        
        
    } andErrorBlock:^(NSError *error) {
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GLViewPagerViewControllerDataSource
- (NSUInteger)numberOfTabsForViewPager:(GLViewPagerViewController *)viewPager {
    return self.viewControllersArray.count;
}


- (UIView *)viewPager:(GLViewPagerViewController *)viewPager
      viewForTabIndex:(NSUInteger)index {
    UILabel *label = [[UILabel alloc]init];
//    TabbarDataModel*data=_categoriesArray[index];
//    label.text = data.name;
    label.text=@"ONE";
    label.font = [UIFont systemFontOfSize:16.0];
    label.textColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    return label;
}

- (UIViewController *)viewPager:(GLViewPagerViewController *)viewPager
contentViewControllerForTabAtIndex:(NSUInteger)index {
    return self.viewControllersArray[index];
}
#pragma mark - GLViewPagerViewControllerDelegate
- (void)viewPager:(GLViewPagerViewController *)viewPager didChangeTabToIndex:(NSUInteger)index fromTabIndex:(NSUInteger)fromTabIndex {
    UILabel *prevLabel = (UILabel *)[viewPager tabViewAtIndex:fromTabIndex];
    UILabel *currentLabel = (UILabel *)[viewPager tabViewAtIndex:index];
    prevLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
    currentLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
    prevLabel.textColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    currentLabel.textColor = [UIColor colorWithWhite:0.0 alpha:1.0];
}

- (void)viewPager:(GLViewPagerViewController *)viewPager willChangeTabToIndex:(NSUInteger)index fromTabIndex:(NSUInteger)fromTabIndex withTransitionProgress:(CGFloat)progress {
    
    if (fromTabIndex == index) {
        return;
    }
    
    UILabel *prevLabel = (UILabel *)[viewPager tabViewAtIndex:fromTabIndex];
    UILabel *currentLabel = (UILabel *)[viewPager tabViewAtIndex:index];
    prevLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                                 1.0 - (0.1 * progress),
                                                 1.0 - (0.1 * progress));
    currentLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                                    0.9 + (0.1 * progress),
                                                    0.9 + (0.1 * progress));
    prevLabel.textColor = [UIColor colorWithWhite:0.0 alpha:1.0 - (0.5 * progress)];
    currentLabel.textColor = [UIColor colorWithWhite:0.0 alpha:0.5 + (0.5 * progress)];
}

- (CGFloat)viewPager:(GLViewPagerViewController *)viewPager widthForTabIndex:(NSUInteger)index {
    static UILabel *prototypeLabel ;
    if (!prototypeLabel) {
        prototypeLabel = [[UILabel alloc]init];
    }
//    TabbarDataModel *data=[_categoriesArray objectAtIndex:index];
//    prototypeLabel.text = data.name;
    prototypeLabel.text=@"ONE";
    prototypeLabel.textAlignment = NSTextAlignmentCenter;
    prototypeLabel.font = [UIFont systemFontOfSize:16.0];
    return prototypeLabel.intrinsicContentSize.width;
}


-(void)backButtonClicked:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

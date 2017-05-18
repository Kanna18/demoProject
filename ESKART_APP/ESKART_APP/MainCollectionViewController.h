//
//  MainCollectionViewController.h
//  ESKART_APP
//
//  Created by Gaian on 4/23/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationBar.h"
#import <KYDrawerController.h>
#import "ServerAPIManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "HomeCollectionViewCell.h"
#import "OffersCollectionViewCell.h"
#import "ProductDetailTableController.h"

#import "ProductDetail.h"
#import "MainCellData.h"

#import "EskartSharedClass.h"

extern BOOL firstLogin;
@interface MainCollectionViewController : UICollectionViewController<CustomNavigatonDelegates>
@end

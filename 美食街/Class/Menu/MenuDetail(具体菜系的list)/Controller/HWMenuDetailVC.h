//
//  HWChuanCaiViewController.h
//  美食街
//
//  Created by Jerry Huang on 2018/1/19.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWMenuStyleOfCookingItem;
@interface HWMenuDetailVC : UITableViewController
//** dataItem */
@property (strong, nonatomic) HWMenuStyleOfCookingItem *dataItems;
@end

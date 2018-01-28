//
//  HWChuanCaiViewController.m
//  美食街
//
//  Created by Jerry Huang on 2018/1/19.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWMenuDetailVC.h"
#import <AFHTTPSessionManager.h>
#import "HWMenuDetailCell.h"
#import "HWMenuDetailItem.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>
#import "HWMenuStyleOfCookingItem.h"
#import "HWMenuOfLocationViewController.h"


static NSString * const ID = @"chuancaicell";

@interface HWMenuDetailVC ()
/* 数据 */
@property(strong,nonatomic)NSArray *items;


@end

@implementation HWMenuDetailVC




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册川菜cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HWMenuDetailCell" bundle:nil] forCellReuseIdentifier:ID];
    
//    [self loadData];
    
    
}


-(NSArray *)items{
    if (!_items) {
        _items = [NSArray array];
    }
    return _items;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    if (!_items) {
        [self loadDataWithClassID:self.dataItems.classid];
    }
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

-(void)loadDataWithClassID:(NSString *)classid{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{
                   @"classid" : classid,
                   @"start" : @"0",
                   @"num" : @"20",
                   @"appkey" : APPKEY
                   };
    //显示hud
    [SVProgressHUD showWithStatus:@"正在帮你加载菜系,请稍后..."];

        [mgr GET:@"https://way.jd.com/jisuapi/byclass" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            //通过指定的classid请求到相对应的菜系菜谱数据(比如:川菜 -> 20个菜谱字典)数组,然后把字典数组转换成模型数组赋值给items数组保存起来
            self.items = [HWMenuDetailItem mj_objectArrayWithKeyValuesArray:responseObject[@"result"][@"result"][@"list"]];
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
        }];
    
    

}

//当点击Menu控制器的具体一个cell后,给MenuDetail控制器的模型赋值,然后来到这里
- (void)setDataItems:(HWMenuStyleOfCookingItem *)dataItems{
    _dataItems = dataItems;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HWMenuDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    HWMenuDetailItem *item = self.items[indexPath.row];
    cell.item = item;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([HWMenuOfLocationViewController class]) bundle:nil];
    HWMenuOfLocationViewController *locationMenuVC = [storyboard instantiateInitialViewController];
    
    //从这里把数据传进去
    
    locationMenuVC.item = self.items[indexPath.row];
    
    
    [self.navigationController pushViewController:locationMenuVC animated:YES];
    
}



@end

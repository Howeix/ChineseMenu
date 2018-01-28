//
//  HWMenuViewController.m
//  美食街
//
//  Created by 黄炜 on 2018/1/17.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWMenuViewController.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "HWMenuStyleOfCookingCell.h"
#import "HWMenuStyleOfCookingItem.h"
#import <SVProgressHUD.h>
#import "HWMenuDetailVC.h"
#import "HWMenuDetailItem.h"



static NSString * const ID = @"styleOfCookingCell";

@interface HWMenuViewController ()
/* dataArr */
@property(strong,nonatomic)NSMutableArray *items;
/* mgr */
@property(strong,nonatomic)AFHTTPSessionManager *mgr;
/* v */
@property(weak,nonatomic)UIView *v;
@end

@implementation HWMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HWMenuStyleOfCookingCell" bundle:nil] forCellReuseIdentifier:ID];
//    self.view.backgroundColor = [UIColor grayColor];
    
//    [self loadData];
    
    self.title = @"菜谱";
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    [self loadData];
    
}


-(NSMutableArray *)dataArr{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [SVProgressHUD dismiss];
//    [_mgr.tasks makeObjectsPerformSelector:@selector(cancel)];
}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//        [SVProgressHUD showWithStatus:@"正在帮你加载菜系,请稍后..."];
//        [self loadData];
//}

-(void)loadData{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    _mgr = mgr;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
//    parameters[@"menu"] = @"白菜";
    parameters[@"appkey"] = APPKEY;
    
    

        //显示hud
        [SVProgressHUD showWithStatus:@"正在为您加载菜谱..."];
    
    
        //添加门板在window上
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    UIView *v = [UIView new];
//    v.frame = window.frame;
//    v.backgroundColor = XMGColor(66, 66, 66);
//    self.v = v;
//    [window addSubview:v];
    
        [mgr GET:@"https://way.jd.com/jisuapi/recipe_class" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            /* 收费接口
             NSDictionary *dict = responseObject[@"result"];
             NSArray *dataArr = dict[@"result"];
             dataArr = dataArr[4][@"list"];
             _items = [HWMenuStyleOfCookingItem mj_objectArrayWithKeyValuesArray:dataArr];
             //将获取到的菜系数据保存入数组
             
             [SVProgressHUD dismiss];
             [self.tableView reloadData];
             */
            
            //免费接口
            //获取菜系的数据列表
            NSMutableArray *dataArr = responseObject[@"result"][@"result"][4][@"list"];

            //模型数组
            _items = [HWMenuStyleOfCookingItem mj_objectArrayWithKeyValuesArray:dataArr];
            
            [_items removeObjectsInRange:NSMakeRange(33, 11)];
            [_items removeObjectAtIndex:28];
            [_items removeObjectAtIndex:29];
            
            [SVProgressHUD dismiss];
            
            [self.v removeFromSuperview];
            
            [self.tableView reloadData];
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
            
        }];
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HWMenuStyleOfCookingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    HWMenuStyleOfCookingItem *item = self.dataArr[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

//点击菜谱控制器中的cell来到这里
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HWMenuDetailVC *vc = [HWMenuDetailVC new];
    vc.hidesBottomBarWhenPushed = YES;
    //当点击Menu控制器具体哪一行时会来到这里\
    根据具体点击的行数来判断创建的模型
//    HWMenuStyleOfCookingItem *item = self.items[indexPath.row];
    
    //self.items为模型数组, 取出指定行的模型赋值给控制器的模型dataItems
    vc.dataItems = self.items[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];

    
}


@end

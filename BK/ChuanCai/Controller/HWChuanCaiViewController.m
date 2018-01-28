//
//  HWChuanCaiViewController.m
//  美食街
//
//  Created by Jerry Huang on 2018/1/19.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWChuanCaiViewController.h"
#import <AFHTTPSessionManager.h>
#import "HWChuanCaiCell.h"
#import "HWChuanCaiItem.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>

static NSString * const ID = @"chuancaicell";

@interface HWChuanCaiViewController ()
/* 数据 */
@property(strong,nonatomic)NSArray *items;
/* v */
@property(weak,nonatomic)UIView *v;

@end

@implementation HWChuanCaiViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注册川菜cell
    self.title = @"川菜菜品";
    [self.tableView registerNib:[UINib nibWithNibName:@"HWChuanCaiCell" bundle:nil] forCellReuseIdentifier:ID];
    
    [self loadData];
}


-(NSArray *)items{
    if (!_items) {
        _items = [NSArray array];
    }
    return _items;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}

-(void)loadData{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    
    NSDictionary *parameters = @{
                   @"classid" : @"225",
                   @"start" : @"0",
                   @"num" : @"20",
                   @"appkey" : APPKEY
                   };
    
    //显示hud
    [SVProgressHUD showWithStatus:@"正在帮你加载菜系,请稍后..."];
    
    
    [mgr GET:@"https://way.jd.com/jisuapi/byclass" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dataArr = responseObject[@"result"][@"result"][@"list"];
        self.items = [HWChuanCaiItem mj_objectArrayWithKeyValuesArray:dataArr];
        
//        HWChuanCaiItem *item = self.items[0];
        [SVProgressHUD dismiss];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.items.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HWChuanCaiCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    HWChuanCaiItem *item = self.items[indexPath.row];
    
    cell.item = item;
    
    return cell;
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

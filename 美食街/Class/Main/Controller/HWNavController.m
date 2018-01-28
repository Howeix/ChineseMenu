//
//  HWNavController.m
//  美食街
//
//  Created by 黄炜 on 2018/1/17.
//  Copyright © 2018年 黄炜. All rights reserved.
//

#import "HWNavController.h"


@interface HWNavController ()

@end

@implementation HWNavController

+(void)initialize{
    //拿到导航条标签
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"Nav_Bar"] forBarMetrics:UIBarMetricsDefault];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
}



@end

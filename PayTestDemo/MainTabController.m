//
//  MainTabController.m
//  PayTestDemo
//
//  Created by MAC on 17/3/29.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "MainTabController.h"
#import "PaymentViewController.h"
#import "LLPayRoute.h"

@interface MainTabController ()


@end

@implementation MainTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *navArray = [NSMutableArray array];
    for (int i =0 ; i < 3 ; i ++) {
        UIViewController *vc = [UIViewController new];
        vc.title = [NSString stringWithFormat:@"我是第%d个控制器",i];
        vc.view.backgroundColor = [UIColor whiteColor];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [navArray addObject:nav];
    }
    

    self.viewControllers = navArray;
    [self regiestRouteForSecondNav:navArray[1]];
    
}

- (void)regiestRouteForSecondNav:(UINavigationController *)nav {
    UILabel *labe = [[UILabel alloc]init];
    labe.center = nav.viewControllers.firstObject.view.center;
    labe.bounds = nav.viewControllers.firstObject.view.bounds;
    labe.backgroundColor = [UIColor lightGrayColor];
    [nav.viewControllers.firstObject.view addSubview:labe];
    __weak typeof(self)weakSelf = self;
    [[LLPayRoute llPayRoute] monitorRouteWithNameSpace:@"payDemo" routeType:@"viewController&paycount&shopID" handler:^(NSDictionary<NSString *,NSString *> *params) {
        weakSelf.selectedIndex = 1;
        NSLog(@"\n=================\n%@\n================",params);
        labe.text = [NSString stringWithFormat:@"RoutViewController:%@",params[@"viewController"]];
        if ([params[@"viewController"] isEqualToString:@"PaymentViewController"]) {
            Class class = NSClassFromString(params[@"viewController"]);
            PaymentViewController *vc = [[class alloc]init];
            vc.payCount = params[@"paycount"];
            vc.shopID = params[@"shopID"];
            vc.hidesBottomBarWhenPushed = YES;
            [nav pushViewController:vc animated:YES];
        }else {
            Class class = NSClassFromString(params[@"viewController"]);
            [nav pushViewController:[[class alloc]init] animated:YES];
        }

    }];
    //payDemo://PaymentViewController&500&payShopID777
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

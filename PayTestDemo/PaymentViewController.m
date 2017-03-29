//
//  PaymentViewController.m
//  PayTestDemo
//
//  Created by MAC on 17/3/29.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "PaymentViewController.h"
#import "MBProgressHUD.h"

@interface PaymentViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *payCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ReceivingSideLaebl;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation PaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.payCountLabel.text = [NSString stringWithFormat:@"¥%@",self.payCount];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.title = @"确认支付";
    
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //此处使用在开发平台注册商家ID进行网络请求 获取商家名称,商家收款方等信息
        self.contentView.hidden = NO;
        self.shopNameLabel.text = @"XXXXXXXXXX商家";
        self.ReceivingSideLaebl.text = @"XXXXXXXXXX有限公司";
        self.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleAction)]];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}



- (void)cancleAction {
    //UIAlertView已废弃,凑合用!
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"是否要放弃本次交易" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://500",self.shopID]]];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)paymentClickAction:(id)sender {
    //模拟支付请求
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //此处使用在开发平台注册商家ID进行网络请求 获取商家名称,商家收款方等信息
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@://200",self.shopID]]];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
        });

    });

}




@end

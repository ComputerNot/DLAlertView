//
//  ViewController.m
//  DLAlertViewDemo
//
//  Created by John on 2016/10/26.
//  Copyright © 2016年 lingda. All rights reserved.
//

#import "ViewController.h"
#import "DLAlertView.h"

@interface ViewController ()<DLAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DLAlertView *alertView = [DLAlertView alertViewWithTitle:@"更新提示" subTitle:@"1.0.3" contentText:@"【新增功能】\n车型及VIN码搜索：您可以通过车型或是VIN码来搜索产品啦\n代理商管理中心：您可以在个人中心内查看你的代理信息\n联系客服：如果您想要对产品进行咨询，可以随时联系我们\n产品图片保存：您可以保存产品图片" cancelButton:@"残忍拒绝" enterButton:@"确定"];
    alertView.delegate = self;
    [alertView show];
}


#pragma mark - DLAlertDelegate
- (void)dlAlertViewEnterButtonClick
{
    NSLog(@"你点击了AlertView确定按钮");
}
- (void)dlAlertViewCancelButtonClick
{
    NSLog(@"你点击了AlertView取消按钮");
}


#pragma mark - Shit
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

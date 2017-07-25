//
//  OneViewController.m
//  底部导航Demo
//
//  Created by 付吉祥 on 16/3/14.
//  Copyright © 2016年 siyucloud. All rights reserved.
//

#import "OneViewController.h"
#import "Level2ViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"showMainTabBar" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel * label = [[UILabel alloc]initWithFrame:self.view.frame];
    label.text = @"首页";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:75];
    label.font = [UIFont boldSystemFontOfSize:75];
    [self.view addSubview:label];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 175, 100);
    btn.titleLabel.text = @"Push";
    btn.layer.borderWidth = 2;
    btn.layer.borderColor = [UIColor greenColor].CGColor;
    btn.layer.cornerRadius = 20;
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)push{
    Level2ViewController * l2 = [[Level2ViewController alloc]init];
    [self.navigationController pushViewController:l2 animated:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

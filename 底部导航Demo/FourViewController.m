//
//  FourViewController.m
//  底部导航Demo
//
//  Created by 付吉祥 on 16/3/14.
//  Copyright © 2016年 siyucloud. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc]initWithFrame:self.view.frame];
    label.text = @"个人中心";
    label.font = [UIFont systemFontOfSize:75];
    label.font = [UIFont boldSystemFontOfSize:75];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
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

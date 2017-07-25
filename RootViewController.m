//
//  RootViewController.m
//  底部导航Demo
//
//  Created by 付吉祥 on 16/3/14.
//  Copyright © 2016年 siyucloud. All rights reserved.
//

#import "RootViewController.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface RootViewController ()<MainTabBarDelegate>

@end



@implementation RootViewController

- (id)init{
    self = [super init];
    if (self) {
        //首页
        OneViewController *c_1 = [[OneViewController alloc]init];
        homePageNavigator = [[UINavigationController alloc] initWithRootViewController:c_1];
        //homePageNavigator.navigationBarHidden = YES;
        [self addChildViewController:homePageNavigator];
        
        //聚这
        TwoViewController *c_2 = [[TwoViewController alloc]init];
        gatherNavigator = [[UINavigationController alloc] initWithRootViewController:c_2];
        //gatherNavigator.navigationBarHidden = YES;
        [self addChildViewController:gatherNavigator];
        
        //个人中心
        ThreeViewController *c_3 = [[ThreeViewController alloc]init];
        personalNavigator = [[UINavigationController alloc] initWithRootViewController:c_3];
        //personalNavigator.navigationBarHidden = YES;
        [self addChildViewController:personalNavigator];
        
        //积分中心
        
        FourViewController *c_4 = [[FourViewController alloc]init];
        integralNavigator = [[UINavigationController alloc] initWithRootViewController:c_4];
        //integralNavigator.navigationBarHidden = YES;
        [self addChildViewController:integralNavigator];
        
        
        
        //底部导航
        CGRect mainTabBarFrame = [UIScreen mainScreen].bounds;
        mainTabBarFrame.origin.y = mainTabBarFrame.size.height  - 69 + 20;
        mainTabBarFrame.size.height =  49;
        _tabBar = [[TabBar alloc] initWithFrame:mainTabBarFrame];
        _tabBar.delegate = self;
        [self.view addSubview:_tabBar];
        [self refreshData];
        
        //注册通知
        
        //显示一级导航
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showMainTabbar:) name:@"showMainTabBar" object:nil];
        //隐藏一级导航
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenMainTabbar:) name:@"hiddenMainTabBar" object:nil];
        
    }
    return self;

}

-(void)refreshData
{
    if (currentNavigator == nil)
    {
        currentNavigator = homePageNavigator;
        [self.view addSubview:homePageNavigator.view];
        [self.view bringSubviewToFront:_tabBar];
    }
}

//设置上一页
//- (void)setLastSelectedItemNavigation
//{
//    if(currentNavigator == homePageNavigator)
//    {
//        _lastSelectedNavigator = homePageNavigator;
//    }
//    if(currentNavigator == gatherNavigator)
//    {
//        _lastSelectedNavigator = gatherNavigator;
//    }
//    if(currentNavigator == personalNavigator)
//    {
//        _lastSelectedNavigator = personalNavigator;
//    }
//    if(currentNavigator == integralNavigator)
//    {
//        _lastSelectedNavigator = integralNavigator;
//    }
//}


//一级菜单点击事件
- (void)mainTabBar:(TabBar *)mainTabBar selectItem:(MainTabBarItem)item
{
    
    //[self setLastSelectedItemNavigation];
    
    [currentNavigator.view removeFromSuperview];
    
    switch (item) {
            
        case MainTabBarItemHome:
        {
            currentNavigator = homePageNavigator;
        }
            break;
            
        case MainTabBarItemGather:
        {
            currentNavigator = gatherNavigator;
        }
            break;
            
        case MainTabBarItemPersonal:
        {
            currentNavigator = personalNavigator;
        }
            break;
            
        case MainTabBarItemIntegralCenter:
        {
            currentNavigator = integralNavigator;
        }
            break;
            
        default:
            break;
            
    }
    
    [self.view addSubview:currentNavigator.view];
    
    [self.view bringSubviewToFront:_tabBar];
    
    //    个人中心无论是否登录界面都显示注释掉判断是否登录的（@黄秀 14.11.11）
    //    if(currentNavigator == personalCenterNavigator)
    //    {
    //        if (![CommonTool checkLoginStatus]) {
    //            [[NSNotificationCenter defaultCenter] postNotificationName:Notification_UserLogin_Start object:nil];
    //            return;
    //        }
    //    }
    
    if (_lastSelectedNavigator == currentNavigator) {
        
        return;
    }
}

//显示底部导航
-(void)showMainTabbar:(NSNotification*)notification
{
    CGRect mainTabBarFrame = [UIScreen mainScreen].bounds;
    mainTabBarFrame.origin.y = mainTabBarFrame.size.height  - 69 + 20;
    mainTabBarFrame.size.height =  49;
    [UIView beginAnimations:nil context:nil];
    [UIView  setAnimationDuration:0.40];
    [_tabBar setFrame:mainTabBarFrame];
    [UIView commitAnimations];
}

//隐藏底部导航
-(void)hiddenMainTabbar:(NSNotification*)notification
{
    CGRect mainTabBarFrame = [UIScreen mainScreen].bounds;
    mainTabBarFrame.origin.y = mainTabBarFrame.size.height+10;
    mainTabBarFrame.size.height =  0;
    [UIView beginAnimations:nil context:nil];
    [UIView  setAnimationDuration:0.40];
    [_tabBar setFrame:mainTabBarFrame];
    [UIView commitAnimations];
}


- (void)viewDidLoad {
    [super viewDidLoad];
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

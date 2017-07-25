//
//  RootViewController.h
//  底部导航Demo
//
//  Created by 付吉祥 on 16/3/14.
//  Copyright © 2016年 siyucloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBar.h"

@interface RootViewController : UIViewController

{
    //首页
    UINavigationController* homePageNavigator;
    //聚这
    UINavigationController* gatherNavigator;
    //个人中心
    UINavigationController* personalNavigator;
    //积分中心
    UINavigationController* integralNavigator;
   
    
    //当前 tab页
    UINavigationController *currentNavigator;
    //上一个 tab页
    UINavigationController *_lastSelectedNavigator;
    
    TabBar *_tabBar;//Tabbar 首页 搜索 个人中心 购物车 更多
}

@end

//
//  TabBar.h
//  底部导航Demo
//
//  Created by 付吉祥 on 16/3/14.
//  Copyright © 2016年 siyucloud. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MainTabBarItem)
{
    MainTabBarItemHome = 100,//首页
    MainTabBarItemGather,//聚这
    MainTabBarItemIntegralCenter,//积分中心
    MainTabBarItemPersonal,//个人
    
};

@protocol MainTabBarDelegate;

@interface TabBar : UIView

@property(nonatomic, assign) id<MainTabBarDelegate> delegate;
@property(nonatomic) MainTabBarItem currentSelected;

@end

@protocol MainTabBarDelegate <NSObject>
//可选择实现方法
@optional
-(void)mainTabBar:(TabBar *)mainTabBar selectItem:(MainTabBarItem)item;
//@required  强制实现方法
@end

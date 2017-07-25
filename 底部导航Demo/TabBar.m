//
//  TabBar.m
//  底部导航Demo
//
//  Created by 付吉祥 on 16/3/14.
//  Copyright © 2016年 siyucloud. All rights reserved.
//

#import "TabBar.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define IPHONEWIDTH  [UIScreen mainScreen].bounds.size.width
@interface TabBar()
{
    UIButton *_home;
    UIButton *_gather;
    UIButton *_integralCenter;
    UIButton *_personal;
    //    UIImageView *_numberView;
    //    UIImageView *_moreUpdate;
    //    UIButton *_more;
    MainTabBarItem _currentSelected;
    //    UILabel *titleLabel;
    
    UIImageView * homeImage;
    UIImageView * gatherImage;
    UIImageView * intergralImage;
    UIImageView * personImage;
    
}



@end
@implementation TabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        UIToolbar * bgView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, -1, self.bounds.size.width, self.bounds.size.height+1)];
        bgView.barStyle = UIBarStyleDefault;
        [self addSubview:bgView];
        self.clipsToBounds = YES;
        
        UILabel * line=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5f)];
        line.backgroundColor=UIColorFromRGB(0xd8d8d8);
        [self addSubview:line];
        
        NSArray * btnTitleArr = [[NSArray alloc]init];
        NSArray * btnTagArr = [[NSArray alloc]init];
        NSArray * picArr = [[NSArray alloc]init];
        
        btnTitleArr = @[@"首页",@"分类",@"购物车",@"我的"];
        btnTagArr = @[[NSNumber numberWithInteger:MainTabBarItemHome],[NSNumber numberWithInteger:MainTabBarItemGather],[NSNumber numberWithInteger:MainTabBarItemIntegralCenter],[NSNumber numberWithInteger:MainTabBarItemPersonal]];
        picArr = @[@"home.png",@"category.png",@"tabShopCar.png",@"my.png"];
        
        for (int i = 0; i < btnTitleArr.count; i++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = [btnTagArr[i] integerValue];
            btn.frame = CGRectMake(IPHONEWIDTH/btnTitleArr.count * i, 0, IPHONEWIDTH/btnTitleArr.count, 50);
            btn.backgroundColor = [UIColor clearColor];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btn setTitle:btnTitleArr[i] forState :UIControlStateNormal];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:11];
            btn.titleEdgeInsets =  UIEdgeInsetsMake(btn.frame.size.height-9,10,btn.frame.size.height-39,10);
            [btn addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:btn];
            
            UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake((btn.frame.size.width-22)/2, 8, 22, 22)];
            imageView.backgroundColor = [UIColor clearColor];
            imageView.image = [UIImage imageNamed:picArr[i]];
            imageView.contentMode =  UIViewContentModeScaleAspectFill;
            imageView.tag = [btnTagArr[i] integerValue] + 100;
            [btn addSubview:imageView];
        }
        
        _home = (UIButton *)[self viewWithTag:MainTabBarItemHome];
        _gather = (UIButton *)[self viewWithTag:MainTabBarItemGather];
        _integralCenter = (UIButton *)[self viewWithTag:MainTabBarItemIntegralCenter];
        _personal = (UIButton *)[self viewWithTag:MainTabBarItemPersonal];
        
        
        homeImage = (UIImageView *)[self viewWithTag:MainTabBarItemHome + 100];
        gatherImage = (UIImageView *)[self viewWithTag:MainTabBarItemGather + 100];
        intergralImage = (UIImageView *)[self viewWithTag:MainTabBarItemIntegralCenter + 100];
        personImage = (UIImageView *)[self viewWithTag:MainTabBarItemPersonal + 100];
        
        
        //数字角标
        //        self.numberView = [[UIImageView alloc] initWithFrame:CGRectMake((shopCarImage.frame.size.width + shopCarImage.frame.origin.x-7), 3, 16, 16)];
        //        self.numberView.image = [UIImage imageNamed:@"common_shopCar_bgCircle_red"];
        //        self.numberView.layer.cornerRadius=self.numberView.frame.size.width/2;
        //
        //        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 3, 16, 10)];
        //        titleLabel.textAlignment = NSTextAlignmentCenter;
        //        titleLabel.textColor = [UIColor whiteColor];
        //        [titleLabel setBackgroundColor:[UIColor clearColor]];
        //        titleLabel.font = [UIFont boldSystemFontOfSize:9];
        //        [self.numberView addSubview:titleLabel];
        //        self.numberView.hidden = YES;
        //        [self.shopCar addSubview:self.numberView];
        
        
        
        //        //版本更新角标
        //        self.moreUpdate = [[UIImageView alloc] initWithFrame:CGRectMake((IPHONEWIDTH/5-29), 6, 8, 8)];
        //        [self.moreUpdate setImage:[UIImage imageNamed:@"readinfo"]];
        //        self.moreUpdate.backgroundColor=[UIColor colorWithRed:255.0f/255.0f green:75.0f/255.0f blue:50.0f/255.0f alpha:1];
        //        self.moreUpdate.layer.cornerRadius=self.moreUpdate.frame.size.width/2;
        //        self.moreUpdate.hidden = YES;
        //        [self.more addSubview:self.moreUpdate];
        
        self.currentSelected = MainTabBarItemHome;
    }
    return self;
}

-(void)setCurrentSelected:(MainTabBarItem)currentSelected
{
    
    
    if (_currentSelected == currentSelected) {
        return;
    }
    _home.selected = false;
    _gather.selected = false;
    _integralCenter.selected= false;
    _personal.selected = false;
    
    UIButton *item =(id)[self viewWithTag:currentSelected];
    item.selected = true;
    /*
     底部导航点击的状态设置
     
     */
    
    if(_home.state == UIControlStateNormal)
    {
        [homeImage setImage:[UIImage imageNamed:@"home.png"]];
    }
    else
    {
        [homeImage setImage:[UIImage imageNamed:@"homeSelect.png"]];
    }
    
    if(_integralCenter.state == UIControlStateNormal)
    {
        [intergralImage setImage:[UIImage imageNamed:@"category.png"]];
    }
    else
    {
        [intergralImage setImage:[UIImage imageNamed:@"categorySelect.png"]];
    }
    
    if(_gather.state == UIControlStateNormal)
    {
        [gatherImage setImage:[UIImage imageNamed:@"tabShopCar.png"]];
    }
    else
    {
        [gatherImage setImage:[UIImage imageNamed:@"tabShopCar.png"]];
    }
    
    if(_personal.state == UIControlStateNormal)
    {
        [personImage setImage:[UIImage imageNamed:@"my.png"]];
    }
    else
    {
        [personImage setImage:[UIImage imageNamed:@"mySelect.png"]];
    }
    
}
-(void)itemSelected:(id)sender
{
    UIButton *item = sender;
    self.currentSelected = item.tag;
    if ([self.delegate respondsToSelector:@selector(mainTabBar:selectItem:)]) {
        [self.delegate mainTabBar:self selectItem:item.tag];
    }
    
    
    
    
}

@end
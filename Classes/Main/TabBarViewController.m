//
//  TabBarViewController.m
//  FM
//
//  Created by user on 2017/8/9.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "FindViewController.h"
#import "BuyCarViewController.h"
#import "MyViewController.h"
#import "TabBar.h"
#import "UIImage+Image.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController
// 只会调用一次
+ (void)load
{
    // 获取哪个类中UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 设置按钮选中标题的颜色:富文本:描述一个文字颜色,字体,阴影,空心,图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1 添加子控制器(5个子控制器) -> 自定义控制器 -> 划分项目文件结构
    [self setupAllChildViewController];
    
    // 2 设置tabBar上按钮内容 -> 由对应的子控制器的tabBarItem属性
    [self setupAllTitleButton];
    
    // 3.自定义tabBar
    [self setupTabBar];


}
#pragma mark - 自定义tabBar
- (void)setupTabBar
{
    TabBar *tabBar = [[TabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
}

/*
 Changing the delegate of a tab bar 【managed by a tab bar controller】 is not allowed.
 被UITabBarController所管理的UITabBar的delegate是不允许修改的
 */

#pragma mark - 添加所有子控制器
- (void)setupAllChildViewController
{
    // 首页
    HomeViewController *essenceVc = [[HomeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:essenceVc];
    // initWithRootViewController:push
    [self addChildViewController:nav];
    
    // 发现
    FindViewController *newVc = [[FindViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:newVc];
    [self addChildViewController:nav1];
    
    // 购物车
    BuyCarViewController *ftVc = [[BuyCarViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:ftVc];
    [self addChildViewController:nav3];
    
    // 我
    MyViewController *my = [[MyViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:my];
    [self addChildViewController:nav4];
    
}

// 设置tabBar上所有按钮内容
- (void)setupAllTitleButton
{
    // 1:首页
    UINavigationController *nav = self.childViewControllers[0];
    nav.tabBarItem.title = @"首页";
    nav.tabBarItem.image = [UIImage imageNamed:@"tabBar_0"];
    // 快速生成一个没有渲染图片
    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_0_selected"];
    
    // 1:发
    UINavigationController *nav1 = self.childViewControllers[1];
    nav1.tabBarItem.title = @"新帖";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_1"];
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_1_selected"];
    
    // 3.购物车
    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"购物车";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_2"];
    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_2_selected"];
    
    // 4.我
    UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"我的";
    nav4.tabBarItem.image = [UIImage imageNamed:@"tabBar_3"];
    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_3_selected"];
}- (void)didReceiveMemoryWarning {
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

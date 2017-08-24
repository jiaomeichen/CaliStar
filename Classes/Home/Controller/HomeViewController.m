//
//  HomeViewController.m
//  CaliStar
//
//  Created by user on 2017/8/21.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import "HomeViewController.h"
#import "OneViewController.h"
#import "CarModelViewController.h"
#import "AllCityViewController.h"
#import "PriceCarViewController.h"
#import "AfterSalesViewController.h"
#import "CommunityViewController.h"
#import "InformationViewController.h"
#import "PortServicesViewController.h"
#import "HYPageView.h"
@interface HomeViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) HYPageView *pageView;
@end

@implementation HomeViewController

- (HYPageView *)pageView {
    if (!_pageView) {
        _pageView = [[HYPageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,ScreenHeight) withTitles:@[@"精选",@"行业资讯",@"车型库",@"全国体系",@"口岸服务",@"产品报价",@"售后服务",@"企业社区"] withViewControllers:@[@"OneViewController",@"OneViewController",@"OneViewController",@"OneViewController",@"OneViewController",@"OneViewController",@"OneViewController",@"OneViewController"] withParameters:nil];
        _pageView.pageViewStyle = HYPageViewStyleA;
        _pageView.isAdapteNavigationBar = NO;
        _pageView.selectedColor = [UIColor colorWithRed:143./255 green:122/255. blue:16/255. alpha:1];
        
        _pageView.defaultSubscript = 0;
    }
    return _pageView;
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden =YES;
        
}
- (void)viewDidDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden =NO;
    
}
#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.pageView];
    
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

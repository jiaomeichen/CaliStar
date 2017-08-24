//
//  Const.m
//  CaliStar
//
//  Created by user on 2017/8/23.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Const.h"

@implementation Const
/** UITabBar的高度 */
CGFloat const TabBarH = 49;

/** 导航栏的最大Y值 */
CGFloat const NavMaxY = 64;

/** 标题栏的高度 */
CGFloat const TitlesViewH = 35;

/** 全局统一的间距 */
CGFloat const Marin = 10;

/** 统一的一个请求路径 */
NSString  * const CommonURL = @"http://api.budejie.com/api/api_open.php";

/** TabBarButton被重复点击的通知 */
NSString  * const TabBarButtonDidRepeatClickNotification = @"TabBarButtonDidRepeatClickNotification";

/** TitleButton被重复点击的通知 */
NSString  * const TitleButtonDidRepeatClickNotification = @"TitleButtonDidRepeatClickNotification";


@end

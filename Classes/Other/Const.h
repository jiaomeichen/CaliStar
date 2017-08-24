//
//  Const.h
//  CaliStar
//
//  Created by user on 2017/8/23.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Const : NSObject
/** UITabBar的高度 */
UIKIT_EXTERN CGFloat const TabBarH;

/** 导航栏的最大Y值 */
UIKIT_EXTERN CGFloat const NavMaxY;

/** 标题栏的高度 */
UIKIT_EXTERN CGFloat const TitlesViewH;

/** 全局统一的间距 */
UIKIT_EXTERN CGFloat const Marin;

/** 统一的一个请求路径 */
UIKIT_EXTERN NSString  * const CommonURL;

/** TabBarButton被重复点击的通知 */
UIKIT_EXTERN NSString  * const TabBarButtonDidRepeatClickNotification;

/** TitleButton被重复点击的通知 */
UIKIT_EXTERN NSString  * const TitleButtonDidRepeatClickNotification;

@end

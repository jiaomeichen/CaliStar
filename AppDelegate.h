//
//  AppDelegate.h
//  CaliStar
//
//  Created by user on 2017/8/21.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


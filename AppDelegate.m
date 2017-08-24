//
//  AppDelegate.m
//  CaliStar
//
//  Created by user on 2017/8/21.
//  Copyright © 2017年 开利星空电子商务有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[LoginViewController alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
//    if ([self isFirstLogin]) {
//        self.window.rootViewController=[[LoginViewController alloc]init];
//        [self.window makeKeyWindow];
//        //将应用停止
//        return NO;
//    }else{
//        //UITabBarController控制器
//        TabBarViewController *myTabBar=[[TabBarViewController alloc]init];
//        self.window.rootViewController=myTabBar;
//        //改变程序启动欢迎页的时间
//        [NSThread sleepForTimeInterval:3];
//        [self.window makeKeyAndVisible];
//        return YES;
//    }
    
}
-(BOOL)isFirstLogin{
    
    //判断是不是第一次登陆
    YYLog(@"当前登陆状态1为%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"isFirstLogin"])
    //获取本地APP版本号
    NSString *myBanben=[[[NSBundle mainBundle]infoDictionary]objectForKey:@"CFBundleShortVersionString"];
    //判断本地APP版本号和本地存储的版本号是否一致
    NSString *myAPPBanBen=[[NSUserDefaults standardUserDefaults]objectForKey:@"MyAppVersionStr"];
    //当前版本与本地不一致的情况下  进行更新
    if (![myBanben isEqualToString:myAPPBanBen]) {
        //修改为不是第一次登陆
        [[NSUserDefaults standardUserDefaults]setObject:@"YES" forKey:@"isFirstLogin"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return YES;
    }else{
        //版本相同有两种情况：1不用更新
        if ([[[NSUserDefaults standardUserDefaults]objectForKey:@"isFirstLogin"] isEqualToString:@"NO"]) {
            return NO;
        }else{
            //2.用更新
            return YES;
        }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CaliStar"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

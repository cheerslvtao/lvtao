//
//  AppDelegate.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/14.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "AppDelegate.h"
#import "RegisteViewController.h"
#import "CheckingViewController.h"
#import "RootTabBarViewController.h"
#import "ShenHeViewController.h"
#import "JPUSHService.h"
#import "ViewController.h"
@interface AppDelegate ()
{
    RootTabBarViewController * rootVC ;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //-----------------------------------------------
    //                   推送
    //-----------------------------------------------
    //1.注册APNS类型
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
        //categories 可以自定义添加
        [JPUSHService registerForRemoteNotificationTypes:UIUserNotificationTypeSound | UIUserNotificationTypeBadge | UIUserNotificationTypeAlert categories:nil];
    }else{
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:UIUserNotificationTypeSound | UIUserNotificationTypeBadge | UIUserNotificationTypeAlert categories:nil];
    }
    
    //2.启动SDK
    [JPUSHService setupWithOption:launchOptions appKey:@"2d07b1ea66524e2d6fbb4f54"
                          channel:nil
                 apsForProduction:NO
            advertisingIdentifier:nil];

    
    
    
    //-----------------------------------------------
    //                   3D Touch
    //-----------------------------------------------
    UIApplicationShortcutItem * shotItem1 = [[UIApplicationShortcutItem alloc]initWithType:@"订单详情" localizedTitle:@"订单详情"];
    UIApplicationShortcutItem * shotItem2 = [[UIApplicationShortcutItem alloc]initWithType:@"我的" localizedTitle:@"我的"];
    NSArray * shotArr = [[NSArray alloc]initWithObjects:shotItem1,shotItem2, nil];
    [[UIApplication sharedApplication] setShortcutItems:shotArr];
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setUpApprance];
    [self statusOfUser]; //判断用户状态
    [self.window makeKeyAndVisible];
    

    return YES;
}

#pragma mark == 推送

// - 注册 DeviceToken
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [JPUSHService registerDeviceToken:deviceToken];
}

//  处理收到的 APNs 消息
//-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
//     NSLog(@"userInfo ----APNS---->>>  %@",userInfo);
//    [JPUSHService handleRemoteNotification:userInfo];
//   
//}
//
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"userInfo -------->>>  %@",userInfo);
    ViewController * checking = [[ViewController alloc]init];
    checking.hidesBottomBarWhenPushed = YES;
    [[rootVC.viewControllers objectAtIndex:0]  pushViewController:checking animated:YES];
    completionHandler(UIBackgroundFetchResultNewData);
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
    
}

//程序进入前台的时候讲小红点标志 置为0
-(void)applicationWillEnterForeground:(UIApplication *)application{
    [application setApplicationIconBadgeNumber:0];
}

#pragma mark == 3D Touch
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    if ([shortcutItem.localizedTitle isEqualToString:@"我的"]){

        rootVC.selectedIndex = 3;
    }

}

#pragma mark == 判断注册  登录   状态
-(void)statusOfUser{
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    BOOL status = [[user objectForKey:@"status4"] boolValue];
    if (!status) {
        //如果设备刚启动APP或者是审核失败 跳转到注册界面
        [self goRegisterView];
    }else if(!status){
        //如果是正在审核中 跳转到正在审核界面
        CheckingViewController * checking = [[CheckingViewController alloc]init];
        self.window.rootViewController = checking;
    }else if(status){
        //如果注册成功并审核通过则跳转到主界面
        rootVC = [[RootTabBarViewController alloc]init];
        self.window.rootViewController = rootVC;
    }
}

#pragma mark == 注册页面
-(void)goRegisterView{
    
    RegisteViewController * registeVC = [[RegisteViewController alloc]init];
    UINavigationController * nv = [[UINavigationController alloc]initWithRootViewController:registeVC];
    self.window.rootViewController = nv ;
    
}

#pragma mark == 统一设置导航条背景图片
-(void)setUpApprance{
    UIImage * barImage = nil;
    barImage = [UIImage imageNamed:@"headbg"];
    barImage = [barImage resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setBackgroundImage:[barImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end

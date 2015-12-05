//
//  AppDelegate.m
//  LoginTest1202
//
//  Created by 劉坤昶 on 2015/12/2.
//  Copyright © 2015年 劉坤昶 Johnny. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTVC.h"
#import "LandingPage.h"

#import "LoginVC.h"



#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
//    LandingPage *firstPage = [LandingPage new];
//    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstPage];
    
    
    HomeTVC *test = [HomeTVC new];
    UINavigationController *testNav = [[UINavigationController alloc] initWithRootViewController:test];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = testNav;
    [self.window makeKeyAndVisible];
    
    
    [Parse setApplicationId:@"qg38sxySWH19E6LMj4E1In1pSBGRSOT3reQvD78h" clientKey:@"iAnIIKyBX3MlBvrBT96wSBSdothSxwLGG8qaCOuv"];
    
    
    ////
//    PFObject *anotherClass= [PFObject objectWithClassName:@"player"];
//    [anotherClass setObject:@"Johnny" forKey:@"Name"];
//    [anotherClass setObject:[NSNumber numberWithInt:2000] forKey:@"Score"];
//    [anotherClass saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//        
//        if (succeeded) {
//            NSLog(@"建置成功");
//        }else{
//            NSLog(@"失敗失敗");
//        }
//        
//    }];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

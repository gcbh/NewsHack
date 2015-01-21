//
//  AppDelegate.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse setApplicationId:@"Go57RM0P3W5s9noQOPcPMyXtIuZPpJ85KOAHglUS"
                  clientKey:@"jMdGXKe8vanPLRFwQwe0cnATIrmPMVibuvDP6Hn1"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    NHNewsViewController *view = [[NHNewsViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.window setRootViewController:view];
    [self.window makeKeyAndVisible];
    
    [self setUpHNK];
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

#pragma mark - Image Loading and Cashing (HNK)
- (void) setUpHNK {
    HNKCacheFormat *format = [[HNKCacheFormat alloc]initWithName:@"feedImage"];
    format.scaleMode = HNKScaleModeAspectFill;
    format.compressionQuality = 0.5;
    format.diskCapacity = 2 * 1024 * 1024; // 2MB
    format.preloadPolicy = HNKPreloadPolicyLastSession;
    [[HNKCache sharedCache] registerFormat:format];
}

@end
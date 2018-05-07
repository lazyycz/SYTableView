//
//  AppDelegate.m
//  SYTableViewDemo
//
//  Created by Stone.Yu on 2018/5/4.
//  Copyright © 2018年 Stone.Yu. All rights reserved.
//

#import "AppDelegate.h"
#import "SYTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    SYTableViewController *vc = [[SYTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = nvc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

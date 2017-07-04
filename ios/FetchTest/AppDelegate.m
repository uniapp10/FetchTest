/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "ZDHomeTableController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  ZDHomeTableController *homeController = [ZDHomeTableController new];
  UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeController];
  nav.navigationBar.translucent = false;
  nav.navigationBar.barTintColor = [UIColor colorWithWhite:0.5 alpha:0.5];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = nav;
  [self.window makeKeyAndVisible];
  return YES;
}

@end

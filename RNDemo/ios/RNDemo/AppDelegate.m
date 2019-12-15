/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"
#import "UIViewController+RN.h"
#import "FYRNBridgeHelper.h"
#import "FYViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [FYRNBridgeHelper registerWithLaunchOptions:launchOptions];
  
  NSString *Main = @"Main";
  NSString *TestRender = @"TestRender";
  NSString *ReactNavigationDemo = @"ReactNavigationDemo";
  
  UIViewController *rootVc = [UIViewController viewControllerWithModuleName:Main initialProperties:nil];
  _nav = [[FYNavigationController alloc] initWithRootViewController:rootVc];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = _nav;
  [self.window makeKeyAndVisible];
  return YES;
}

@end

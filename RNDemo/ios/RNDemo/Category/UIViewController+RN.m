//
//  UIViewController+RN.m
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "UIViewController+RN.h"
#import "RCTRootView+Extend.h"

@implementation UIViewController (RN)
+ (instancetype)viewControllerWithModuleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProperties
{
  UIViewController *vc = [UIViewController new];
  RCTRootView *rootView = [RCTRootView rootViewWithModuleName:moduleName initialProperties:initialProperties];
  vc.view = rootView;
  return vc;
}
@end

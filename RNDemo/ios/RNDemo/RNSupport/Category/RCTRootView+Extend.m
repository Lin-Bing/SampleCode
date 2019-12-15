//
//  RCTRootView+Extend.m
//  RNDemo
//
//  Created by linbing on 2019/1/31.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RCTRootView+Extend.h"
#import "FYRNBridgeHelper.h"

@implementation RCTRootView (Extend)
+ (instancetype)rootViewWithModuleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProperties
{
  RCTBridge *bridge = [FYRNBridgeHelper shareInstance].bridge;
  RCTRootView *rootView = [[self alloc] initWithBridge:bridge moduleName:moduleName initialProperties:initialProperties];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  return rootView;
}
@end

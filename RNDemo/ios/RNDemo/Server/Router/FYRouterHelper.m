//
//  FYRouterHelper.m
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FYRouterHelper.h"
#import "UINavigationController+global.h"
#import "UIViewController+RN.h"

#import "FYViewController.h"
#import "FYSettingViewController.h"

@implementation FYRouterHelper

+ (void)pushSetting
{
  FYSettingViewController *setting = [FYSettingViewController new];
  [UINavigationController pushViewController:setting animated:YES];
}

+ (void)pushMyCollection
{
  FYViewController *myCollection = [FYViewController new];
  myCollection.title = @"我的收藏";
  myCollection.view.backgroundColor = [UIColor greenColor];
  [UINavigationController pushViewController:myCollection animated:YES];
}

+ (void)pushOrderWithType:(NSInteger)type
{
  FYViewController *order = [FYViewController new];
  order.title = [NSString stringWithFormat:@"订单 %@", @(type)];
  order.view.backgroundColor = [UIColor blueColor];
  [UINavigationController pushViewController:order animated:YES];
}

+ (void)pushNotifySetting
{
  UIViewController *notifySetting = [UIViewController viewControllerWithModuleName:@"NotifySetting" initialProperties:@{@"para":@"参数参数。。。。"}];
  [UINavigationController pushViewController:notifySetting animated:YES];
}

@end


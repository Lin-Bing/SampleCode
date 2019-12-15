//
//  FYSettingViewController.m
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYSettingViewController.h"
#import "FYRouterHelper.h"


@interface FYSettingViewController ()

@end

@implementation FYSettingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"设置";
  self.view.backgroundColor = [UIColor lightGrayColor];
  
  
  UIButton *btn = [UIButton new];
  [btn setTitle:@"通知设置" forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [btn setBackgroundColor:[UIColor whiteColor]];
  btn.frame = CGRectMake(200, 100, 100, 50);
  [btn addTarget:self action:@selector(p_notifySetting) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
  
}

- (void)p_notifySetting
{
  [FYRouterHelper pushNotifySetting];
}

@end

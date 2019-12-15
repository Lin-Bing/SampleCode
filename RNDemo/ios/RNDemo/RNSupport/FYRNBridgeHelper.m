//
//  FYRNBridgeHelper.m
//  RNDemo
//
//  Created by linbing on 2019/1/31.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYRNBridgeHelper.h"


@interface FYRNBridgeHelper() <RCTBridgeDelegate>
@property (nonatomic, strong) RCTBridge *bridge;
@end

@implementation FYRNBridgeHelper

static FYRNBridgeHelper * _instance;

+ (void)registerWithLaunchOptions:(NSDictionary *)launchOptions
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _instance = [[self alloc] initWithLaunchOptions:launchOptions];
  });
}

+ (instancetype)shareInstance
{
  return _instance;
}

- (instancetype)initWithLaunchOptions:(NSDictionary *)launchOptions;
{
  if (self = [super init]) {
    _bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  }
  return self;
}

#pragma mark - RCTBridgeDelegate
- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#ifdef DEBUG
  return [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
#else
  NSString *path = [[NSBundle mainBundle] pathForResource:@"bundle/index.ios.jsbundle" ofType:nil];
  return [NSURL fileURLWithPath:path];
#endif
}
@end

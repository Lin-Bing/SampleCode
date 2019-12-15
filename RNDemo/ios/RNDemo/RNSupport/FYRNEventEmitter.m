//
//  FYRNEventEmitter.m
//  RNDemo
//
//  Created by linbing on 2019/1/24.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYRNEventEmitter.h"

NSString * const EnterBackground = @"EnterBackground";
NSString * const BecomeActive    = @"BecomeActive";

@interface FYRNEventEmitter()
@property (nonatomic, assign) BOOL hasListeners;
@end

@implementation FYRNEventEmitter

RCT_EXPORT_MODULE(EventEmitter);

// 导出可供监听的事件
- (NSArray<NSString *> *)supportedEvents
{
  return @[EnterBackground, BecomeActive];
}

- (instancetype)init
{
  if (self = [super init])
  {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_enterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(p_becomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
  }
  return self;
}

- (void)startObserving
{
  self.hasListeners = YES;
}
- (void)stopObserving
{
  self.hasListeners = NO;
}

- (void)p_enterBackground:(NSNotification *)notification
{
  if (!self.hasListeners) { return; }
  [self sendEventWithName:EnterBackground body:@{@"msg" : @"应用进入后台啦", @"others" : @"其他参数"}];
}
- (void)p_becomeActive:(NSNotification *)notification
{
  if (!self.hasListeners) { return; }
  [self sendEventWithName:BecomeActive body:@{@"msg" : @"应用进入前台啦", @"others" : @"其他参数"}];
}

// 导出常量
- (NSDictionary *)constantsToExport
{
  return @{
           @"becomeActive" : BecomeActive,
           @"enterBackground" : EnterBackground
           };
}
+ (BOOL)requiresMainQueueSetup
{
  return YES;
}
@end

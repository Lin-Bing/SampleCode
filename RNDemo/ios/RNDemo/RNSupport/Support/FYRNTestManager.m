//
//  FYCalendarManager.m
//  RNDemo
//
//  Created by linbing on 2019/1/20.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYRNTestManager.h"
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

@implementation FYRNTestManager

/*
 * RCT_EXPORT_MODULE宏作用
 实现RCTBridgeModule协议，声明moduleName，供JS端使用
 覆盖load方法，调用RCTRegisterModule函数，把本类注册到bridge的原生模块表RCTModuleClasses
 */

RCT_EXPORT_MODULE(TestManager)
/*
 extern __attribute__((visibility("default"))) void RCTRegisterModule(Class);
 + (NSString *)moduleName {
    return @"TestManager";
 }
 + (void)load {
    RCTRegisterModule(self);
 }
 */


// 类整体线程控制
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(nonnull NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch)
{
  NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
  RCTLogInfo(@"Date : %@",date);
}

/*
 + (const RCTMethodInfo *)__rct_export__390 {
   static RCTMethodInfo config = {
      "",
      "addEvent:(NSString *)name location:(NSString *)location date:(NSNumber *)secondsSinceUnixEpoch",
      NO,
   };
   return &config;
 }
 - (void)addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch ;
 {
    NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
    RCTLogInfo(@"Date : %@",date);
 }
 */


// 带回调函数
RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
  RCTLogInfo(@"do something...");
  RCTLogInfo(@"thread : %@", [NSThread currentThread]);
  NSArray *events = @[@"events1", @"events2"];
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      callback(@[[NSNull null], events]);
  });
}


/*
+ (const RCTMethodInfo *)__rct_export__361 {
  static RCTMethodInfo config = {
    "", "findEvents:(RCTResponseSenderBlock)callback", __objc_no
  };
  return &config;
}
- (void)findEvents:(RCTResponseSenderBlock)callback ;
{
  RCTLogInfo(@"do something...");
  RCTLogInfo(@"thread : %@", [NSThread currentThread]);
  NSArray *events = @[@"events1", @"events2"];
  callback(@[[NSNull null], events]);
}
*/

// 函数名映射； 返回Promise
RCT_REMAP_METHOD(findEventsWithResolver, findEvents:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  RCTLogInfo(@"do something...");
  // 特定方法执行线程
  dispatch_async(dispatch_get_global_queue(0, 0), ^{
    RCTLogInfo(@"thread : %@", [NSThread currentThread]);
    
    NSArray *events = @[@"events1", @"events2", @"events3", @"events4"];
    if (events) {
      resolve(events);
    } else {
      NSError *error = [NSError errorWithDomain:@"no event..." code:0 userInfo:nil];
      reject(@"no_events", @"There were no events", error);
    }
  });
}

- (NSDictionary *)constantsToExport
{
  return @{
           @"age" : @18,
           @"name" : @"fyfy",
           @"tag" : @"Handsome",
           };
}
+ (BOOL)requiresMainQueueSetup
{
  return YES;
}
@end

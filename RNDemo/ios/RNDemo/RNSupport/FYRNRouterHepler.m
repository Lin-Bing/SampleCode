//
//  FYRNRouterHepler.m
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYRNRouterHepler.h"
#import "FYRouterHelper.h"
#import <React/RCTLog.h>

static NSString * const Setting = @"Setting";
static NSString * const MyCollection = @"MyCollection";
static NSString * const Order = @"Order";

@implementation FYRNRouterHepler

RCT_EXPORT_MODULE(RouterHepler)

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

#pragma mark - RN to Native

RCT_EXPORT_METHOD(pushPage:(NSString *)pageName params:(nullable NSDictionary *)params)
{

  if ([pageName isEqualToString:Setting])
  {
    [FYRouterHelper pushSetting];
  }
  else if ([pageName isEqualToString:MyCollection])
  {
    [FYRouterHelper pushMyCollection];
  }
  else if ([pageName isEqualToString:Order])
  {
    NSInteger type = [params[@"type"] integerValue];
    [FYRouterHelper pushOrderWithType:type];
  }
  else
  {
    RCTLog(@"待处理");
  }
}


RCT_EXPORT_METHOD(popPage:(NSString*)pageId params:(nullable NSDictionary *)params)
{
  if (pageId) {
    NSLog(@"=====");
  } else {
    RCTLog(@"待处理");
  }
}

- (NSDictionary *)constantsToExport
{
  return @{
           Setting : Setting,
           MyCollection : MyCollection,
           Order : Order,
           };
}
+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end

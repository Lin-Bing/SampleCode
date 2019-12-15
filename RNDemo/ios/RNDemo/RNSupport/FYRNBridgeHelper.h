//
//  FYRNBridgeHelper.h
//  RNDemo
//
//  Created by linbing on 2019/1/31.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>

@interface FYRNBridgeHelper : NSObject
@property (nonatomic, strong, readonly) RCTBridge *bridge;

+ (void)registerWithLaunchOptions:(NSDictionary *)launchOptions;
+ (instancetype)shareInstance;

@end

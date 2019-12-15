//
//  FYRouterHelper.h
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FYRouterHelper : NSObject

#pragma mark - Native
+ (void)pushSetting;
+ (void)pushMyCollection;
+ (void)pushOrderWithType:(NSInteger)type;

#pragma mark - RN
+ (void)pushNotifySetting;

@end

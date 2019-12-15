//
//  RCTRootView+Extend.h
//  RNDemo
//
//  Created by linbing on 2019/1/31.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <React/RCTRootView.h>
#import <UIKit/UIKit.h>

@interface RCTRootView (Extend)
+ (instancetype)rootViewWithModuleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProperties;
@end

//
//  UIViewController+RN.h
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+global.h"

@interface UIViewController (RN)
+ (instancetype)viewControllerWithModuleName:(NSString *)moduleName initialProperties:(NSDictionary *)initialProperties;
@end

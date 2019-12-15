//
//  UINavigationController+global.h
//
//
//  Created by linbing on 2018/6/23.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (global)
+ (UINavigationController *)global;
+ (void)setViewControllers:(NSArray<UIViewController *>*)viewControllers animated:(BOOL)animated;
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (void)popViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (void)popToRootViewController:(BOOL)animated;

+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion;
+ (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;
@end

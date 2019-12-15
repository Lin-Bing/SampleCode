//
//  UINavigationController+global.m
//  
//
//  Created by linbing on 2018/6/23.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "UINavigationController+global.h"
#import "AppDelegate.h"

@implementation UINavigationController (global)
+ (UINavigationController *)global
{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).nav;
}
+ (void)setViewControllers:(NSArray<UIViewController *>*)viewControllers animated:(BOOL)animated
{
    [self.global setViewControllers:viewControllers animated:animated];
}
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.global pushViewController:viewController animated:animated];
}
+ (void)popViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController && [self.global.viewControllers containsObject:viewController])
    {
        [self.global popToViewController:viewController animated:animated];
    }
    else
    {
        [self.global popViewControllerAnimated:animated];
    }
}
+ (void)popToRootViewController:(BOOL)animated;
{
    [self.global popToRootViewControllerAnimated:animated];
}

+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion
{
    if (self.global.presentedViewController)
    {
        [self.global.presentedViewController dismissViewControllerAnimated:animated completion:^{
            [self.global presentViewController:viewController animated:animated completion:completion];
        }];
    }
    else
    {
        [self.global presentViewController:viewController animated:animated completion:completion];
    }
}

+ (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [self.global dismissViewControllerAnimated:animated completion:completion];
}

@end

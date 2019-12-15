//
//  FYNavigationController.m
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYNavigationController.h"

@interface FYNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>
@end

@implementation FYNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.navigationBarHidden = YES;

  __weak FYNavigationController *weakself = self;
  if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
  {
    self.interactivePopGestureRecognizer.delegate = weakself;
    self.delegate = weakself;
  }
}

#pragma mark - Override
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
  {
    self.interactivePopGestureRecognizer.enabled = NO;
  }
  viewController.hidesBottomBarWhenPushed = [self.childViewControllers count] == 1;
  [super pushViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
  [viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    if (idx == 0)
    {
      obj.hidesBottomBarWhenPushed = NO;
    }
    else
    {
      obj.hidesBottomBarWhenPushed = YES;
      *stop = YES;
    }
  }];
  [super setViewControllers:viewControllers animated:animated];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
  {
    if ([self.viewControllers count] == 1)
    {
      self.interactivePopGestureRecognizer.enabled = NO;
    }
    else
    {
      self.interactivePopGestureRecognizer.enabled = YES;
    }
  }
}


#pragma mark - Orientation
- (BOOL)shouldAutorotate
{
  return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
  return self.topViewController.supportedInterfaceOrientations;
}

@end

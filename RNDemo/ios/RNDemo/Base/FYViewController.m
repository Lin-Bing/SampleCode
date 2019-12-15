//
//  FYViewController.m
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "FYViewController.h"
#import "YCFFunctions.h"
#import "UINavigationController+global.h"


@interface FYNavBar()
@end
@implementation FYNavBar

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame])
  {
    self.backgroundColor = [UIColor whiteColor];
    [self p_drawSubViews];
  }
  return self;
}

- (void)p_drawSubViews
{
  _container = [UIView new];
  
  _titleLabel = [UILabel new];
  _titleLabel.font = [UIFont systemFontOfSize:15];
  _titleLabel.textColor = [UIColor blackColor];
  _titleLabel.textAlignment = NSTextAlignmentCenter;
  
  _backItem = [[UIButton alloc] init];
  [_backItem setImage:[UIImage imageNamed:@"nav_back_icon"] forState:UIControlStateNormal];
  
  self.container.frame = CGRectMake(0, YCFStatusBarHeight(), YCFScreenWidth(), YCFNavigationBarHeight()-YCFStatusBarHeight());
  self.titleLabel.frame = CGRectMake(150, 0, 100, YCFNavigationBarHeight()-YCFStatusBarHeight());
  self.backItem.frame = CGRectMake(0, 0, 50, 40);
  [self addSubview:_container];
  [self.container addSubview:_titleLabel];
  [self.container addSubview:_backItem];
}
@end


@interface FYViewController ()

@end

@implementation FYViewController

- (void)dealloc
{
  NSLog(@"%s", __func__);
}

- (id)init
{
  if (self = [super init])
  {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
  }
  return self;
}

- (void)loadView
{
  [super loadView];
  self.view.backgroundColor = YCFColorStrHex(@"f6f6f6");
  [self drawNavBar];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self.view bringSubviewToFront:self.navBar];
}

#pragma mark - draw
- (void)drawNavBar
{
  _navBar = [[FYNavBar alloc] init];
  _navBar.titleLabel.text = self.title;
  [_navBar.backItem addTarget:self action:@selector(p_back) forControlEvents:UIControlEventTouchUpInside];
  _navBar.frame = CGRectMake(0, 0, YCFScreenWidth(), YCFNavigationBarHeight());
  [self.view addSubview:_navBar];
}

- (void)setTitle:(NSString *)title
{
  [super setTitle:title];
  _navBar.titleLabel.text = title;
}

- (void)p_back
{
  [UINavigationController popViewController:nil animated:YES];
}

@end

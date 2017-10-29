//
//  FYLayoutAnchorViewController.m
//  AutpLayouTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYLayoutAnchorViewController.h"

@interface FYLayoutAnchorViewController ()

@end

@implementation FYLayoutAnchorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)drawSubViewsAndMakeConstains
{
    UIView *yellow = [[UIView alloc] init];
    yellow.translatesAutoresizingMaskIntoConstraints = NO;
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    
    UIView *green = [[UIView alloc] init];
    green.translatesAutoresizingMaskIntoConstraints = NO;
    green.backgroundColor = [UIColor greenColor];
    [yellow addSubview:green];
    
    UIView *red = [[UIView alloc] init];
    red.translatesAutoresizingMaskIntoConstraints = NO;
    red.backgroundColor = [UIColor redColor];
    [yellow addSubview:red];
    
    CGFloat margin = 20;
    [yellow.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:margin].active = YES;
    [yellow.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-margin].active = YES;
    [yellow.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100].active = YES;
    [yellow.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-margin].active = YES;
    
    [green.leadingAnchor constraintEqualToAnchor:yellow.leadingAnchor constant:margin].active = YES;
    [green.trailingAnchor constraintEqualToAnchor:yellow.trailingAnchor constant:-margin].active = YES;
    [green.topAnchor constraintEqualToAnchor:yellow.topAnchor constant:margin].active = YES;
    [green.bottomAnchor constraintEqualToAnchor:red.topAnchor constant:-margin].active = YES;
    
    [red.leadingAnchor constraintEqualToAnchor:green.leadingAnchor].active = YES;
    [red.trailingAnchor constraintEqualToAnchor:green.trailingAnchor].active = YES;
    [red.bottomAnchor constraintEqualToAnchor:yellow.bottomAnchor constant:-margin].active = YES;
    [red.heightAnchor constraintEqualToAnchor:green.heightAnchor multiplier:2.0].active = YES;
}

@end

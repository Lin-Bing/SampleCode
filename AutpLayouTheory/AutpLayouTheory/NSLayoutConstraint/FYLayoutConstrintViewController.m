//
//  FYLayoutConstrintViewController.m
//  AutpLayouTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYLayoutConstrintViewController.h"

@interface FYLayoutConstrintViewController ()

@end

@implementation FYLayoutConstrintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)drawSubViewsAndMakeConstains
{
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:greenView];
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:50];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    [self.view addConstraints:@[left, top]];
    [greenView addConstraints:@[width, height]];
    
    //  iOS8+
    //  left.active = YES;
    //  top.active = YES;
    //  width.active = YES;
    //  height.active = YES;
}


@end

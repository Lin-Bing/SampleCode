//
//  FYMasonryViewController.m
//  AutpLayouTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYMasonryViewController.h"

@interface FYMasonryViewController ()

@end

@implementation FYMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)drawSubViewsAndMakeConstains
{
    // 实现NSLayoutAnchor相同的布局
    UIView *yellow = [[UIView alloc] init];
    yellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellow];
    
    UIView *green = [[UIView alloc] init];
    green.backgroundColor = [UIColor greenColor];
    [yellow addSubview:green];
    
    UIView *red = [[UIView alloc] init];
    red.backgroundColor = [UIColor redColor];
    [yellow addSubview:red];
    
    CGFloat margin = 20;
    
    [yellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(margin);
        make.trailing.equalTo(self.view).offset(-margin);
        make.top.equalTo(self.view).offset(100);
        make.bottom.equalTo(self.view).offset(-margin);
    }];
    
    [green mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(yellow).offset(margin);
        make.trailing.equalTo(yellow).offset(-margin);
        make.top.equalTo(yellow).offset(margin);
        make.bottom.equalTo(red.mas_top).offset(-margin);
    }];
    
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(green);
        make.trailing.equalTo(green);
        make.bottom.equalTo(yellow).offset(-margin);
        make.height.equalTo(green).multipliedBy(2.0);
    }];
    
}

@end

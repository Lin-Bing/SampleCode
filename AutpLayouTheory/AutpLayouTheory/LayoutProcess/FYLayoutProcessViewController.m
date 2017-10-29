//
//  FYLayoutProcessViewController.m
//  autolayout
//
//  Created by linbing on 2017/9/14.
//  Copyright © 2017年 bing.lin. All rights reserved.
//

#import "FYLayoutProcessViewController.h"
#import "FYLayoutView.h"


@interface FYLayoutProcessViewController()

@end



@implementation FYLayoutProcessViewController

- (void)viewDidLoad
{
    NSLog(@"%s", __func__);
    
    [super viewDidLoad];
}


- (void)drawSubViewsAndMakeConstains
{
    FYLayoutView *layoutView = [[FYLayoutView alloc] init];
    [self.view addSubview:layoutView];
    
    [layoutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(74, 10, 10, 10));
    }];
}


/* Update Pass
 *
 默认实现是 ： 向self.view发送updateConstraints
 */
- (void)updateViewConstraints
{
//    [super updateViewConstraints];
    [self.view updateConstraints];
    
    NSLog(@"%s", __func__);
}



/* Layout Pass
 */
- (void)viewWillLayoutSubviews
{
    NSLog(@"%s", __func__);
    [super viewWillLayoutSubviews];
}


@end

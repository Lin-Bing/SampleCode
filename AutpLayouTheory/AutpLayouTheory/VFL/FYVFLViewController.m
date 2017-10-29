//
//  FYVFLViewController.m
//  AutpLayouTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYVFLViewController.h"

@interface FYVFLViewController ()

@end

@implementation FYVFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)drawSubViewsAndMakeConstains
{
    UIView *view1 = [[UIView alloc] init];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    
    
    /*
     水平方向约束：
     view1.left = superView.left+50；
     view1.width = 100；
     view1.right+50 = view2.right；
     view2.right+50 = superVew.right；
     
     view1.top = view2.top;
     view1.bottom = view2.bottom;
     
     竖直方向
     view1.top = superView.top+100；
     view1.height = 100;
     */
    NSArray<NSLayoutConstraint *> *horizontalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[view1(100)]-50-[view2]-50-|" options:(NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom) metrics:nil views:NSDictionaryOfVariableBindings(view1, view2)];
    [self.view addConstraints:horizontalConstraint];
    
    NSArray<NSLayoutConstraint *> *verticalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[view1(100)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1, view2)];
    [self.view addConstraints:verticalConstraint];
}


@end

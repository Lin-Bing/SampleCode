//
//  FYStackViewViewController.m
//  AutoLayoutTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYStackViewViewController.h"

@interface FYStackViewViewController ()

@end

@implementation FYStackViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)drawSubViewsAndMakeConstains
{
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.backgroundColor = [UIColor redColor];
    stackView.layer.cornerRadius = 50;
    stackView.layer.masksToBounds = YES;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 8;
    
    [self.view addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(84, 10, 200, 10));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"标题标题";
    label.textAlignment = NSTextAlignmentCenter;
    [stackView addArrangedSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"Snip20170925_112"];
    [imageView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
    
    [stackView addArrangedSubview:imageView];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor yellowColor];
    [btn setTitle:@"按钮按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [stackView addArrangedSubview:btn];
}

@end

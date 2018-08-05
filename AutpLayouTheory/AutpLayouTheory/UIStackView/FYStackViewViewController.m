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
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 8;
    
    [self.view addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(84, 10, 200, 10));
        make.left.equalTo(self.view).offset(5);
        make.right.equalTo(self.view).offset(-5);
        make.top.equalTo(self.view).offset(100);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"标题标题";
    label.textAlignment = NSTextAlignmentCenter;
    [stackView addArrangedSubview:label];
    
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.backgroundColor = [UIColor yellowColor];
    label2.text = @"标题标题2";
    label2.textAlignment = NSTextAlignmentCenter;
    [stackView addArrangedSubview:label2];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.backgroundColor = [UIColor yellowColor];
    label3.text = @"标题标题3";
    label3.textAlignment = NSTextAlignmentCenter;
    [stackView addArrangedSubview:label3];
    
    UILabel *label4 = [[UILabel alloc] init];
    label4.backgroundColor = [UIColor yellowColor];
    label4.text = @"标题标题4";
    label4.textAlignment = NSTextAlignmentCenter;
    [stackView addArrangedSubview:label4];
    
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"Snip20170925_112"];
//    [imageView setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
//    [imageView setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
//
//    [stackView addArrangedSubview:imageView];
//
//    UIButton *btn = [[UIButton alloc] init];
//    btn.backgroundColor = [UIColor yellowColor];
//    [btn setTitle:@"按钮按钮" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [stackView addArrangedSubview:btn];
//
//    label.hidden = YES;
    
}

@end

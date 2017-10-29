//
//  FYIntrinsicContentSizeViewController.m
//  AutoLayoutTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYIntrinsicContentSizeViewController.h"

@interface FYIntrinsicContentSizeViewController ()

@end

@implementation FYIntrinsicContentSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)drawSubViewsAndMakeConstains
{
    
    /**************** intrinsicContentSize *****************/
    
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    [button setTitle:@"按钮按钮按钮" forState:UIControlStateNormal];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(10);
    }];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"Snip20170925_112"];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.left.equalTo(self.view).offset(10);
    }];
    
    
    UIView *view = [[UIView alloc] init];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-100);
        make.left.equalTo(self.view).offset(100);
    }];
    
    
    [self.view layoutIfNeeded];
    
    // UIButton设置内容前后都有intrinsicContentSize
    for (id constrain in button.constraints) {
        NSLog(@"%@;  %f  %f",constrain, (CGFloat)([[constrain valueForKey:@"compressionResistancePriority"] floatValue]), [[constrain valueForKey:@"huggingPriority"] floatValue]);
    }
    
    NSLog(@"UIButton %@\n\n", NSStringFromCGSize(button.intrinsicContentSize));

    
    // UIImageView设置内容之前没有intrinsicContentSize； 设置image后有intrinsicContentSize
    for (id constrain in imageView.constraints) {
        NSLog(@"%@;  %f  %f",constrain, (CGFloat)([[constrain valueForKey:@"compressionResistancePriority"] floatValue]), [[constrain valueForKey:@"huggingPriority"] floatValue]);
    }
    
    NSLog(@"UIImageView %@\n\n", NSStringFromCGSize(imageView.intrinsicContentSize));
    
    
    // UIView没有intrinsicContentSize
    for (id constrain in view.constraints) {
        NSLog(@"%@;  %f  %f",constrain, (CGFloat)([[constrain valueForKey:@"compressionResistancePriority"] floatValue]), [[constrain valueForKey:@"huggingPriority"] floatValue]);
    }
    
    NSLog(@"UIView%@", NSStringFromCGSize(view.intrinsicContentSize));
    
    
    
    
    
    /**************** intrinsicContentSize设置 *****************/

    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"label1";
    label1.textColor = [UIColor blackColor];
    label1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label1];
    
    UITextField *textFeild = [[UITextField alloc] init];
    textFeild.placeholder = @"请输入文本";
    textFeild.textColor = [UIColor blackColor];
    textFeild.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textFeild];
    
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
    }];
    
    [textFeild mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(label1);
    }];
    
    // 水平方向 label保持原尺寸，textFeild允许拉伸/压缩
    [label1 setContentCompressionResistancePriority:UILayoutPriorityRequired-1 forAxis:UILayoutConstraintAxisHorizontal];
    [label1 setContentHuggingPriority:UILayoutPriorityRequired-1 forAxis:UILayoutConstraintAxisHorizontal];
}



@end

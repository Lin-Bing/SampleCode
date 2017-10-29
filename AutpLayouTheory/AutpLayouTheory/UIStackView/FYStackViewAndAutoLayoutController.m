//
//  FYStackViewAndAutoLayoutController.m
//  AutoLayoutTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYStackViewAndAutoLayoutController.h"

@interface FYStackViewAndAutoLayoutController ()

@end

@implementation FYStackViewAndAutoLayoutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)drawSubViewsAndMakeConstains
{
    
    /*************** UIStackView与AutoLayout布局 ****************/
    
    CGFloat spacing = 8;
    
    // name
    UIStackView *firstName = [[UIStackView alloc] init];
    firstName.axis = UILayoutConstraintAxisHorizontal;
    firstName.distribution = UIStackViewDistributionFill;
    firstName.alignment = UIStackViewAlignmentFill;
    firstName.spacing = spacing;
    
    UILabel *fitstLabel = [self p_createLabel:@"First"];
    UITextField *firstTextField = [self p_createTextField:@"Enter First Name"];
    [firstName addArrangedSubview:fitstLabel];
    [firstName addArrangedSubview:firstTextField];
    
    UIStackView *middleName = [[UIStackView alloc] init];
    middleName.axis = UILayoutConstraintAxisHorizontal;
    middleName.distribution = UIStackViewDistributionFill;
    middleName.alignment = UIStackViewAlignmentFill;
    middleName.spacing = spacing;
    
    UILabel *middleLabel = [self p_createLabel:@"Middle"];
    UITextField *middleTextField = [self p_createTextField:@"Enter Middle Name"];
    [middleName addArrangedSubview:middleLabel];
    [middleName addArrangedSubview:middleTextField];
    
    
    UIStackView *lastName = [[UIStackView alloc] init];
    lastName.axis = UILayoutConstraintAxisHorizontal;
    lastName.distribution = UIStackViewDistributionFill;
    lastName.alignment = UIStackViewAlignmentFill;
    lastName.spacing = spacing;
    
    UILabel *lastLabel = [self p_createLabel:@"Last"];
    UITextField *lastTextField = [self p_createTextField:@"Enter Last Name"];
    [lastName addArrangedSubview:lastLabel];
    [lastName addArrangedSubview:lastTextField];
    
    
    UIStackView *name = [[UIStackView alloc] init];
    name.axis = UILayoutConstraintAxisVertical;
    name.distribution = UIStackViewDistributionFill;
    name.alignment = UIStackViewAlignmentFill;
    name.spacing = spacing;
    
    [name addArrangedSubview:firstName];
    [name addArrangedSubview:middleName];
    [name addArrangedSubview:lastName];
    
    
    // icon
    UIStackView *upper = [[UIStackView alloc] init];
    upper.axis = UILayoutConstraintAxisHorizontal;
    upper.distribution = UIStackViewDistributionFill;
    upper.alignment = UIStackViewAlignmentFill;
    upper.spacing = spacing;
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"Snip20170925_112"];
    [upper addArrangedSubview:iconImageView];
    [upper addArrangedSubview:name];
    
    
    // textView
    UITextView *textView = [[UITextView alloc] init];
    textView.backgroundColor = [UIColor lightGrayColor];
    
    
    // button
    UIStackView *butons = [[UIStackView alloc] init];
    butons.axis = UILayoutConstraintAxisHorizontal;
    butons.distribution = UIStackViewDistributionFillEqually;
    butons.alignment = UIStackViewAlignmentFill;
    butons.spacing = spacing;
    
    UIButton *save = [self p_createButtton:@"Save"];
    UIButton *cancel = [self p_createButtton:@"Cancel"];
    UIButton *clear = [self p_createButtton:@"Clear"];
    [butons addArrangedSubview:save];
    [butons addArrangedSubview:cancel];
    [butons addArrangedSubview:clear];
    
    
    // Container
    UIStackView *root = [[UIStackView alloc] init];
    root.axis = UILayoutConstraintAxisVertical;
    root.distribution = UIStackViewDistributionFill;
    root.alignment = UIStackViewAlignmentFill;
    root.spacing = spacing;
    [self.view addSubview:root];
    
    [root addArrangedSubview:upper];
    [root addArrangedSubview:textView];
    [root addArrangedSubview:butons];
    
    
    // 额外约束
    [root mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(84, 10, 100, 10));
    }];
    
    [firstTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@[middleTextField, lastTextField]);
    }];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(iconImageView.mas_height);
    }];
    
    // icon 压缩阻力调低，使得可以被压缩到与name容器等高
    [iconImageView setContentCompressionResistancePriority:230 forAxis:UILayoutConstraintAxisHorizontal];
    [iconImageView setContentCompressionResistancePriority:230 forAxis:UILayoutConstraintAxisVertical];
    
    // testField 水平方向内容吸附调低，使得水平方向可以被拉伸
    [firstTextField setContentHuggingPriority:230 forAxis:UILayoutConstraintAxisHorizontal];
    [middleTextField setContentHuggingPriority:230 forAxis:UILayoutConstraintAxisHorizontal];
    [lastTextField setContentHuggingPriority:230 forAxis:UILayoutConstraintAxisHorizontal];
    
    // textView 竖直方向内容吸附调低，使得竖直方向可以被拉伸
    [textView setContentHuggingPriority:240 forAxis:UILayoutConstraintAxisVertical];
    [textView setContentCompressionResistancePriority:240 forAxis:UILayoutConstraintAxisVertical];
    
    
    
    
    
    /*************** Hidden状态的控件，不影响UIStackView的布局 ****************/
    // AutoLayout，UIView的hidden属性不可动画，UIView添加到arrangedSubviews中，hidden变成可动画属性
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.bottom.offset(-10);
        make.height.equalTo(@50);
    }];
    view.hidden = NO;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:2.0 animations:^{
            view.hidden = YES;  // 不可动画
            cancel.hidden = YES;    // 可动画
        }];
    });
}


#pragma mark - Private

- (UILabel *)p_createLabel:(NSString *)text
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor blackColor];
    
    return label;
}

- (UITextField *)p_createTextField:(NSString *)palceHolder
{
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = palceHolder;
    textField.backgroundColor = [UIColor lightGrayColor];
    
    return textField;
}

- (UIButton *)p_createButtton:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    
    return btn;
}

@end

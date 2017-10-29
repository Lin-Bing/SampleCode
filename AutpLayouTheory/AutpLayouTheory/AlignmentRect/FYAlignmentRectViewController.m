//
//  FYAlignmentRectViewController.m
//  AutoLayoutTheory
//
//  Created by linbing on 2017/10/8.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYAlignmentRectViewController.h"
#import "FYCustomView.h"



@interface FYAlignmentRectViewController ()

@end

@implementation FYAlignmentRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)drawSubViewsAndMakeConstains
{
    
    /*********************** alignmentRect对齐矩形 ********************/
    /*
     Auto Layout布局使用的是View的对齐矩形,忽略装饰元素(阴影、徽章……)，即布局是不会包括阴影等装饰元素，仅仅根据UIView的对齐矩形。
     
     */
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenView];
    
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.top.equalTo(self.view).offset(100);
        make.width.height.equalTo(@100);
    }];
    
    // 添加阴影
    CALayer *greenViewLayer = greenView.layer;
    greenViewLayer.shadowColor = [UIColor lightGrayColor].CGColor;
    greenViewLayer.shadowOpacity = 1.0;  // 此参数默认为0，即阴影不显示
    greenViewLayer.shadowRadius = 5.0;
    greenViewLayer.shadowOffset = CGSizeMake(20, 20);
    
    
    
    
    /*********************** alignmentRect应用场景 ********************/
    
    // image拉伸保护
    UIImage *image = [UIImage imageNamed:@"insure_select_tab_current"];
    CGFloat halfHeight = image.size.height * 0.5;
    CGFloat halfWidth = image.size.width * 0.5;
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight - 1, halfWidth - 1)];
    
    
    // 没有调整AlignmentRect时，阴影部分包括在尺寸范围内
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = image;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(300);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(100);
    }];
    
    // 通过imageWithAlignmentRectInsets，调整AlignmentRect时，阴影部分不包括在尺寸范围内，仅针对核心元素
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.image = [image imageWithAlignmentRectInsets:UIEdgeInsetsMake(12, 12, 0, 12)];
    [self.view addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).offset(50);
        make.top.equalTo(self.view).offset(300);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(100);
    }];
    
    // 通过重写alignmentRectInsets，调整AlignmentRect时，阴影部分不包括在尺寸范围内，仅针对核心元素
    FYCustomView *imageView3 = [[FYCustomView alloc] init];
    imageView3.image = image;
    [self.view addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView2.mas_right).offset(50);
        make.top.equalTo(self.view).offset(300);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(100);
    }];
    
}

@end

//
//  FYLayoutSubView.m
//  autolayout
//
//  Created by linbing on 2017/9/14.
//  Copyright © 2017年 bing.lin. All rights reserved.
//

#import "FYLayoutSubView.h"

@interface FYLayoutSubView()

@property (nonatomic, strong) UIView *view;  /**< <#注释 #>  */

@end


@implementation FYLayoutSubView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self p_drawSubViewsAndMakeConstrains];
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

#pragma mark - Draw

- (void)p_drawSubViewsAndMakeConstrains
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor blueColor];
    [self addSubview:view];
    self.view = view;
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(400);
        
        make.height.mas_equalTo(100);
    }];
    

    // 约束更新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"=======================");
        [view mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(200);
            make.width.mas_equalTo(200);
        }];
    });
    
}


#pragma mark - OverWrite

- (void)setNeedsUpdateConstraints
{
    NSLog(@"%s", __func__);
    
    [super setNeedsUpdateConstraints];
}

- (void)setNeedsLayout
{
    NSLog(@"%s", __func__);
    
    [super setNeedsLayout];
    
}


- (void)updateConstraints
{
    NSLog(@"%s", __func__);
    
    NSLog(@"    begin %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
    [super updateConstraints];
    NSLog(@"    end   %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
    
//    [self setNeedsUpdateConstraints]; // 奔溃
}


- (void)layoutSubviews
{
    NSLog(@"%s", __func__);
    
    NSLog(@"    begin %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
    [super layoutSubviews];
    NSLog(@"    end   %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
}


- (void)setNeedsDisplay
{
    NSLog(@"%s", __func__);
    [super setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"%s", __func__);
    [super drawRect:rect];
}



@end

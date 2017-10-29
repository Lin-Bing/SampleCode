//
//  FYLayoutView.m
//  autolayout
//
//  Created by linbing on 2017/9/14.
//  Copyright © 2017年 bing.lin. All rights reserved.
//

#import "FYLayoutView.h"
#import "FYLayoutSubView.h"



@implementation FYLayoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self p_drawSubViewsAndMakeConstrains];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

#pragma mark - Draw

- (void)p_drawSubViewsAndMakeConstrains
{
    FYLayoutSubView *sub = [[FYLayoutSubView alloc] init];
    [self addSubview:sub];
    
    [sub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.offset(10);
    }];
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

/* Update Pass
 调用之前，由于约束变化，被标记为需要更新约束 needsUpdateConstraints = YES
 调用完毕，标记被置为NO
 */
- (void)updateConstraints
{
    NSLog(@"%s", __func__);

    NSLog(@"    begin %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
    [super updateConstraints];
    NSLog(@"    end   %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
}



/* Layout Pass
 调用之前，self尺寸已经设置好了，subViews没有尺寸
 调用完毕，subViews有尺寸
 */
- (void)layoutSubviews
{
    NSLog(@"%s", __func__);
    
    NSLog(@"    begin %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
    NSLog(@"    begin %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.subviews.firstObject.frame));
    [super layoutSubviews];
    NSLog(@"    end   %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.frame));
    NSLog(@"    end   %zd, %@", self.needsUpdateConstraints, NSStringFromCGRect(self.subviews.firstObject.frame));
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

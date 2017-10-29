//
//  FYCustomView.m
//  AutoLayoutTheory
//
//  Created by linbing on 2017/10/8.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYCustomView.h"

@implementation FYCustomView

/*
 alignmentRectInsets默认返回UIEdgeInsetsZero，frame和alignmentRect重写，当包含装饰元素，可以调整使得对齐矩形忽略装饰元素。
 */
- (UIEdgeInsets)alignmentRectInsets
{
    return UIEdgeInsetsMake(12, 12, 0, 12);
}

@end

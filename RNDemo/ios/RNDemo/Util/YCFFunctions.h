//
//  YCFUtils.m
//  YaoChuFaDataCenterKit
//
//  Created by linbing on 2018/1/4.
//  Copyright © 2018年 要出发. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#pragma mark - 自定义类型

typedef void (^VoidBlock)(void);
typedef void (^BoolBlock)(BOOL aBool);
typedef void (^DictionaryBlock)(NSMutableDictionary* dictionaryOfModelBaseObjects);
typedef void (^ArrayBlock)(NSArray *array);
typedef void (^StringBlock)(NSString *string);
typedef void (^IntBlock)(NSInteger i);
typedef void (^DataBlock)(NSData* dataOfModelBaseObjects);;

typedef void(^VMSuccessHandler)(void);
typedef void(^VMFailureHandler)(NSString *msg);

#pragma mark - 便捷UI函数

#pragma mark  尺寸

/// 状态栏高度
extern CGFloat YCFStatusBarHeight(void);
/// NavBar高度
extern CGFloat YCFNavigationBarHeight(void);
/// 虚拟home键高度
extern CGFloat YCFHomeIndicatorHeight(void);
/// TabBar高度
extern CGFloat YCFTabbarHeight(void);

/// 屏幕bounds
extern CGRect YCFScreenBounds(void);
/// 屏幕尺寸
extern CGSize YCFScreenSize(void);
/// 屏幕宽度
extern CGFloat YCFScreenWidth(void);
/// 屏幕高度
extern CGFloat YCFScreenHeight(void);

/// screen scale
extern CGFloat YCFScreenScale(void);
/// 1 px
extern CGFloat YCFOnePixel(void);

#pragma mark  字体

/// 系统默认字体
extern UIFont *YCFFont(CGFloat fontSize);
/// 加粗字体
extern UIFont *YCFFontBold(CGFloat fontSize);
/// 自定义字体
extern UIFont *YCFFontCustom(NSString *name ,CGFloat size);

#pragma mark 颜色

/// 生成颜色
extern UIColor *YCFColorHex(long hexColor);
extern UIColor *YCFColorStrHex(NSString *hexColor);
/// 生成透明度alpha颜色
extern UIColor *YCFColorHexAndAlpha(long hexColor, float alpha);
extern UIColor *YCFColorStrHexAndAlpha(NSString *hexColor, float alpha);
/// 生成颜色
extern UIColor *YCFColorRGB(CGFloat r, CGFloat g, CGFloat b);
/// 生成颜色
extern UIColor *YCFColorRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha);

#pragma mark 图片

/// 图片
extern UIImage *YCFImage(NSString *imageName);

#pragma mark 其他

/// keyWindow
extern UIWindow *YCFKeyWindow(void);


#pragma mark - 便捷工具函数

#pragma mark  集合操作

/// 获取数组元素
extern id YCFObjectInArrayAtIndex(NSArray *array, NSUInteger index);
/// 获取数组元素（非数组类型或者数组越界或者取出的元素不是给定的类型，都返回nil）
extern id YCFObjectInArray(NSArray *array, NSInteger index, Class elementClass);

/// 字典 获取key对应的value
extern id YCFObjectForKey(NSDictionary *dict, id key);
/// 字典 添加key-value
extern void YCFSetObjectAtDictionary(NSMutableDictionary *dic, id key, id value);

#pragma mark  其他函数

/// 判断是否为空（对象、集合）
extern BOOL YCFIsEmpty(id obj);
/// 判断字符串是否为空
extern BOOL YCFStringIsEmpty(NSString *string);
/// 字符串为 nil 时返回 ""
extern NSString *YCFStringNotNil(NSString *str);

/// CGRect整数化
extern CGRect YCFRectIntegral(CGFloat x, CGFloat y, CGFloat w, CGFloat h);

/// 主线程执行block
extern void YCFOnMainThreadAsync(VoidBlock block);

@interface YCFFunctions : NSObject

@end

//
//  YCFUtils.m
//  YaoChuFaDataCenterKit
//
//  Created by linbing on 2018/1/4.
//  Copyright © 2018年 要出发. All rights reserved.
//

#import "YCFFunctions.h"

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXsMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXSeries (iPhoneX || iPhoneXR || iPhoneXsMax)

#pragma mark - UI便捷函数

#pragma mark  尺寸

/// 状态栏高度
inline CGFloat YCFStatusBarHeight(void)
{
    static CGFloat statuBarHeight;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        statuBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    });
    return statuBarHeight;
}

/// NavBar高度
inline CGFloat YCFNavigationBarHeight(void)
{
    static CGFloat navigationBarHeight = 44;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navigationBarHeight += [UIApplication sharedApplication].statusBarFrame.size.height;
    });
    return navigationBarHeight;
}

/// 虚拟home键高度
inline CGFloat YCFHomeIndicatorHeight(void)
{
    return iPhoneXSeries ? 34 : 0;
}

/// TabBar高度
inline CGFloat YCFTabbarHeight(void)
{
    return 49 + (iPhoneXSeries ? 34 : 0);
}

/// 屏幕bounds
inline CGRect YCFScreenBounds(void)
{
    return [UIScreen mainScreen].bounds;
}
/// 屏幕尺寸
inline CGSize YCFScreenSize(void)
{
   CGRect bounds = [UIScreen mainScreen].bounds;
    return bounds.size;
}

/// 屏幕宽度
inline CGFloat YCFScreenWidth(void)
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    return bounds.size.width;
}

/// 屏幕高度
inline CGFloat YCFScreenHeight(void)
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    return bounds.size.height;
}

/// screen scale
inline CGFloat YCFScreenScale(void)
{
    return [UIScreen mainScreen].scale;
}

/// 1 px
inline CGFloat YCFOnePixel(void)
{
    return 1.0f / [UIScreen mainScreen].scale;
}

#pragma mark  字体

/// 系统默认字体
inline UIFont *YCFFont(CGFloat fontSize)
{
    return [UIFont systemFontOfSize:fontSize];
}

/// 加粗字体
inline UIFont *YCFFontBold(CGFloat fontSize)
{
    return [UIFont boldSystemFontOfSize:fontSize];
}

/// 自定义字体
inline UIFont *YCFFontCustom(NSString *name, CGFloat fontSize)
{
    UIFont *font = [UIFont fontWithName:name size:fontSize];
    if (font == nil) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

#pragma mark 颜色

/// 生成颜色
inline UIColor *YCFColorHex(long hexColor)
{
    return YCFColorHexAndAlpha(hexColor, 1.0f);
}

UIColor *YCFColorStrHex(NSString *hexColor)
{
    if ([hexColor hasPrefix:@"#"]) {
        hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    
    if (YCFStringIsEmpty(hexColor))
    {
        return nil;
    }
    
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

/// 生成透明度alpha颜色
inline UIColor *YCFColorHexAndAlpha(long hexColor, float alpha)
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

UIColor *YCFColorStrHexAndAlpha(NSString *hexColor, float alpha)
{
    if ([hexColor hasPrefix:@"#"]) {
        hexColor = [hexColor stringByReplacingOccurrencesOfString:@"#" withString:@""];
    }
    
    if (YCFStringIsEmpty(hexColor)) {
        return nil;
    }
    
    long hex = [hexColor longLongValue];
    
    return YCFColorHexAndAlpha(hex, alpha);
}

/// 生成颜色
inline UIColor *YCFColorRGB(CGFloat r, CGFloat g, CGFloat b)
{
    return [UIColor colorWithRed:r / 255.00 green:g / 255.00 blue:b / 255.00 alpha:1.0];
}

/// 生成颜色
inline UIColor *YCFColorRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha)
{
    return [UIColor colorWithRed:r / 255.00 green:g / 255.00 blue:b / 255.00 alpha:alpha];
}

#pragma mark 图片

/// 图片
inline UIImage *YCFImage(NSString *imageName)
{
    if(YCFStringIsEmpty(imageName)) {
        return nil;
    } else {
        return [UIImage imageNamed:imageName];
    }
}

#pragma mark 其他

/// keyWindow
inline UIWindow *YCFKeyWindow(void)
{
    return [UIApplication sharedApplication].delegate.window;
}


#pragma mark  集合操作

/// 获取数组元素
id YCFObjectInArrayAtIndex(NSArray *array, NSUInteger index)
{
    if (!([array isKindOfClass:[NSArray class]] || [array isKindOfClass:[NSMutableArray class]])) {
        return nil;
    }
    if (array && array.count > index) {
        return array[index];
    } else {
        return nil;
    }
}

/// 获取数组元素（非数组类型或者数组越界或者取出的元素不是给定的类型，都返回nil）
id YCFObjectInArray(NSArray *array, NSInteger index, Class elementClass)
{
    if (!([array isKindOfClass:[NSArray class]] || [array isKindOfClass:[NSMutableArray class]]))
    {
        return nil;
    }
    if (array && array.count > index && index >= 0)
    {
        id element = array[index];
        if ([element isMemberOfClass:elementClass] || [element isKindOfClass:elementClass])
        {
            return element;
        }
        else
        {
            return nil;
        }
    }
    else
    {
        return nil;
    }
}

/// 获取key对应的value
id YCFObjectForKey(NSDictionary *dict, id key)
{
    if (!([dict isKindOfClass:[NSDictionary class]] || [dict isKindOfClass:[NSMutableDictionary class]])) {
        return nil;
    }
    if (dict.count == 0 || !dict)
    {
        return nil;
    }
    if (!key) {
        return nil;
    }
    id object = [dict objectForKey:key];
    return [object isEqual:[NSNull null]] ? nil : object;
}

/// 字典 添加key-value
void YCFSetObjectAtDictionary(NSMutableDictionary *dic, id key, id value)
{
    if (dic == nil || ![dic isKindOfClass:[NSMutableDictionary class]])
    {
        return;
    }
    if (YCFIsEmpty(key) || ([key isKindOfClass:[NSString class]] && YCFStringIsEmpty(key)) || ![key conformsToProtocol:@protocol(NSCopying)])
    {
        return;
    }
    if (value == nil)
    {
        return;
    }
    [dic setObject:value forKey:key];
}


#pragma mark  工具函数

/// 判断是否为空（对象、集合）
inline BOOL YCFIsEmpty(id obj)
{
    return obj == nil || [obj isEqual:[NSNull null]]
    || ([obj respondsToSelector:@selector(length)]
        && [(NSData *)obj length] == 0)
    || ([obj respondsToSelector:@selector(count)]
        && [(NSArray *)obj count] == 0);
}

/// 判断字符串是否为空
inline BOOL YCFStringIsEmpty(NSString *string)
{
    if (string && ![string isEqual:[NSNull null]] && ![string isEqual:@"(null)"] && ![string isEqualToString:@"<null>"] && [string length] > 0)
    {
        return NO;
    }
    return YES;
}

/// 字符串为 nil 时返回 ""
inline NSString *YCFStringNotNil(NSString *str)
{
    return (str ?: @"");
}

/// CGRect整数化
inline CGRect YCFRectIntegral(CGFloat x, CGFloat y, CGFloat w, CGFloat h)
{
    return CGRectIntegral(CGRectMake((x), (y), (w), (h)));
}

/// 主线程执行block
inline void YCFOnMainThreadAsync(VoidBlock block)
{
    if ([NSThread isMainThread])
    {
      if (block)
      {
        block();
      }
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}


@implementation YCFFunctions

@end


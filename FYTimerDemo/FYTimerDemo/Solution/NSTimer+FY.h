//
//  NSTimer+FY.h
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FYTimerActionBlock)(NSTimer *timer);

@interface NSTimer (FY)

/// 暂停
- (void)fy_pauseTimer;
/// 启动
- (void)fy_resumeTimer;
/// 延迟interval秒启动
- (void)fy_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end


@interface NSTimer (NoCycleReference)

/**
 创建不会循环引用的timer
 
 @param interval  时间间隔
 @param target   target
 @param selector SEL
 @param userInfo 参数
 @param mode runloop模式
 @return timer
 */
+ (instancetype)fy_timerWithTimeInterval:(NSTimeInterval)interval
                                  target:(id)target
                                selector:(SEL)selector
                                userInfo:(id)userInfo
                             runLoopMode:(NSRunLoopMode)mode
                                 repeats:(BOOL)yesOrNo;
@end

@interface NSTimer (Block)

+(instancetype)fy_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                  actionBlock:(FYTimerActionBlock)block
                                         repeats:(BOOL)yesOrNo;

+(instancetype)fy_timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                         actionBlock:(FYTimerActionBlock)block
                         runLoopMode:(NSRunLoopMode)mode
                                repeats:(BOOL)yesOrNo;
@end


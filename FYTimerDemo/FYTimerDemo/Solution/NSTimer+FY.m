//
//  NSTimer+FY.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "NSTimer+FY.h"

@implementation NSTimer (FY)

-(void)fy_pauseTimer {
    
    if (![self isValid]) { return; }
    [self setFireDate:[NSDate distantFuture]];
}

-(void)fy_resumeTimer {
    
    if (![self isValid]) { return ; }
    [self setFireDate:[NSDate date]];
}

- (void)fy_resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    
    if (![self isValid]) { return ; }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end

#pragma mark - 避免循环引用

@interface FYTimerTarget : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer; // weak
@end

@implementation FYTimerTarget
- (void)timerTargetAction:(NSTimer *)timer {
    
    if (self.target) {
        [self.target performSelectorOnMainThread:self.selector withObject:timer waitUntilDone:NO];
    } else {
        [self.timer invalidate];
        self.timer = nil;
    }
}
@end

@implementation NSTimer (NoCycleReference)

+ (instancetype)fy_timerWithTimeInterval:(NSTimeInterval)interval
                                  target:(id)target
                                selector:(SEL)selector
                                userInfo:(id)userInfo
                             runLoopMode:(NSRunLoopMode)mode
                                 repeats:(BOOL)yesOrNo
{
    if (!target || !selector) { return nil; }
    
    // FYTimerTarget作为替代target，避免循环引用
    FYTimerTarget *timerTarget = [[FYTimerTarget alloc] init];
    timerTarget.target = target;
    timerTarget.selector = selector;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:interval target:timerTarget selector:@selector(timerTargetAction:) userInfo:userInfo repeats:yesOrNo];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:mode];
    
    timerTarget.timer = timer;
    
    return timerTarget.timer;
}
@end


@implementation NSTimer (Block)

+ (instancetype)fy_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval
                                     actionBlock:(FYTimerActionBlock)block
                                          repeats:(BOOL)yesOrNo
{
    NSTimer *timer = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(p_timerAction:) userInfo:block repeats:yesOrNo];
    return timer;
}

+ (instancetype)fy_timerWithTimeInterval:(NSTimeInterval)inTimeInterval
                            actionBlock:(FYTimerActionBlock)block
                            runLoopMode:(NSRunLoopMode)mode
                                 repeats:(BOOL)yesOrNo
{
    NSTimer *timer = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(p_timerAction:) userInfo:block repeats:yesOrNo];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:mode];
    return timer;
}

+ (void)p_timerAction:(NSTimer *)timer {
    
    if([timer userInfo]) {
        FYTimerActionBlock actionBlock = (FYTimerActionBlock)[timer userInfo];
        actionBlock(timer);
    }
}
@end


//
//  FYSolutionView.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYSolutionView.h"
#import "NSTimer+FY.h"

@interface FYSolutionView()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FYSolutionView

- (void)dealloc {
    NSLog(@"%s", __func__);
    [_timer invalidate];  // View析构时，由内部invalid
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        
        [self.timer fy_resumeTimer];
    }
    return self;
}

- (void)p_timerAction {
    NSLog(@"%s", __func__);
}

- (NSTimer *)timer {
    if (_timer == nil) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer fy_timerWithTimeInterval:1 actionBlock:^(NSTimer *timer) {
            [weakSelf p_timerAction];
        } runLoopMode:NSRunLoopCommonModes repeats:YES];
    }
    return _timer;
}
@end

//
//  FYLeakView.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYLeakView.h"

@interface FYLeakView()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FYLeakView

- (void)dealloc {
    NSLog(@"%s", __func__);
    [_timer invalidate];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        
        NSLog(@"%@", self.timer);
    }
    return self;
}

- (void)p_timerAction {
    NSLog(@"%s", __func__);
}

- (NSTimer *)timer {
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(p_timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

@end

//
//  FYNormalView.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYNormalView.h"

@interface FYNormalView()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FYNormalView

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)invalidate {
    [self.timer invalidate];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        
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

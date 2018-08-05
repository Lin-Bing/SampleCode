//
//  FYLeakViewController.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYLeakViewController.h"
#import "FYLeakView.h"

@interface FYLeakViewController ()
@property (nonatomic, strong) FYLeakView *leakView;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FYLeakViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
    [_timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"定时器 内存泄漏";
    
    [self.view addSubview:self.leakView];
    self.leakView.frame = CGRectMake(100, 100, 100, 100);
    
    // 触发懒加载
    NSLog(@"%f", self.timer.timeInterval);
}

- (void)p_timerAction {
    NSLog(@"===%s", __func__);
}

- (NSTimer *)timer {
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(p_timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (FYLeakView *)leakView {
    if (_leakView == nil) {
        _leakView = [[FYLeakView alloc] init];
    }
    return _leakView;
}
@end

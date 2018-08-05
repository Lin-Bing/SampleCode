//
//  FYSolutionViewController.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYSolutionViewController.h"
#import "FYSolutionView.h"
#import "NSTimer+FY.h"

@interface FYSolutionViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) FYSolutionView *slView;
@end

@implementation FYSolutionViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
    [_timer invalidate]; // ViewController析构时，由内部invalid
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"定时器 内存泄漏解决方案";
    
    [self.view addSubview:_slView];
    self.slView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.timer fy_resumeTimer];
}

- (void)p_timerAction {
    NSLog(@"%s", __func__);
}

- (NSTimer *)timer {
    
    if (_timer == nil) {
        _timer = [NSTimer fy_timerWithTimeInterval:1 target:self selector:@selector(p_timerAction) userInfo:nil runLoopMode:NSRunLoopCommonModes repeats:YES];
    }
    return _timer;
}

- (FYSolutionView *)slView {
    if (_slView == nil) {
        _slView = [[FYSolutionView alloc] init];
    }
    return _slView;
}

@end

//
//  FYNormalViewController.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYNormalViewController.h"
#import "FYNormalView.h"

@interface FYNormalViewController ()
@property (nonatomic, strong) FYNormalView *normalView;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation FYNormalViewController

- (void)dealloc {
    NSLog(@"%s", __func__);
    [_normalView invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"定时器 避免内存泄漏";
    
    [self.view addSubview:self.normalView];
    self.normalView.frame = CGRectMake(100, 100, 100, 100);
    
    NSLog(@"%f", self.timer.timeInterval);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.timer invalidate]; // invalidate
}


- (void)p_timerAction {
    NSLog(@"%s", __func__);
}

- (NSTimer *)timer {
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(p_timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
        
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(p_timerAction) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (FYNormalView *)normalView {
    if (_normalView == nil) {
        _normalView = [[FYNormalView alloc] init];
    }
    return _normalView;
}

@end

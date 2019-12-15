//
//  FYViewController.h
//  RNDemo
//
//  Created by linbing on 2019/2/1.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FYNavBar : UIView
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *backItem;
@end


@interface FYViewController : UIViewController
@property (nonatomic, strong) FYNavBar *navBar;
@end

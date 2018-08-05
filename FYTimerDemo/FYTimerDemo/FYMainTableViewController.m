//
//  FYMainTableViewController.m
//  FYTimerDemo
//
//  Created by linbing on 2018/8/5.
//  Copyright © 2018年 linbing. All rights reserved.
//

#import "FYMainTableViewController.h"
#import "FYLeakViewController.h"
#import "FYNormalViewController.h"
#import "FYSolutionViewController.h"


static NSString * const kMainTableViewCellID = @"mainTableViewCellID";

@interface FYVcModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) Class VcClass;
@end

@implementation FYVcModel
@end

@interface FYMainTableViewController ()
@property (nonatomic, strong) NSMutableArray<FYVcModel *> *dataArray;
@end

@implementation FYMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMainTableViewCellID];
    
    _dataArray = [[NSMutableArray alloc] init];
    
    FYVcModel *timeLeak = [[FYVcModel alloc] init];
    timeLeak.title = @"定时器 内存泄漏";
    timeLeak.VcClass = [FYLeakViewController class];
    [self.dataArray addObject:timeLeak];
    
    FYVcModel *timeNormal = [[FYVcModel alloc] init];
    timeNormal.title = @"定时器 避免内存泄漏";
    timeNormal.VcClass = [FYNormalViewController class];
    [self.dataArray addObject:timeNormal];
    
    FYVcModel *solution = [[FYVcModel alloc] init];
    solution.title = @"定时器 内存泄漏解决方案";
    solution.VcClass = [FYSolutionViewController class];
    [self.dataArray addObject:solution];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FYVcModel *vcModel = self.dataArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainTableViewCellID forIndexPath:indexPath];
    cell.textLabel.text = vcModel.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FYVcModel *vcModel = self.dataArray[indexPath.row];
    UIViewController *vc = [[vcModel.VcClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

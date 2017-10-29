//
//  FYMainTableViewController.m
//  AutpLayouTheory
//
//  Created by linbing on 2017/9/24.
//  Copyright © 2017年 linbing. All rights reserved.
//

#import "FYMainTableViewController.h"
#import "FYLayoutConstrintViewController.h"
#import "FYVFLViewController.h"
#import "FYLayoutAnchorViewController.h"
#import "FYMasonryViewController.h"
#import "FYStackViewViewController.h"
#import "FYStackViewAndAutoLayoutController.h"

#import "FYIntrinsicContentSizeViewController.h"
#import "FYAlignmentRectViewController.h"
#import "FYLayoutProcessViewController.h"



@interface FYVcModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) Class VcClass;

@end

@implementation FYVcModel

@end




static NSString * const cellID = @"cellReuseIdentifier";


@interface FYMainTableViewController ()

@property (nonatomic, strong) NSMutableArray<FYVcModel *> *autoLayoutDeomArray;
@property (nonatomic, strong) NSMutableArray<FYVcModel *> *autoLayoutKeyKnowledgeArray;

@end

@implementation FYMainTableViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _autoLayoutDeomArray = [[NSMutableArray alloc] init];
    _autoLayoutKeyKnowledgeArray = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self p_createAutoLayoutDeomArray];
    [self p_createAutoLayoutKeyKnowledgeArray];
}


#pragma mark - Private

- (void)p_createAutoLayoutDeomArray
{
    // NSLayoutConstrint
    FYVcModel *layoutConstrint = [[FYVcModel alloc] init];
    layoutConstrint.title = @"NSLayoutConstrint 示例";
    layoutConstrint.VcClass = [FYLayoutConstrintViewController class];
    [self.autoLayoutDeomArray addObject:layoutConstrint];
    
    // VFL
    FYVcModel *VFL = [[FYVcModel alloc] init];
    VFL.title = @"VFL 示例";
    VFL.VcClass = [FYVFLViewController class];
    [self.autoLayoutDeomArray addObject:VFL];
    
    // NSLayoutAnchor
    FYVcModel *layoutAnchor = [[FYVcModel alloc] init];
    layoutAnchor.title = @"NSLayoutAnchor 示例";
    layoutAnchor.VcClass = [FYLayoutAnchorViewController class];
    [self.autoLayoutDeomArray addObject:layoutAnchor];
    
    // Masonry
    FYVcModel *masonry = [[FYVcModel alloc] init];
    masonry.title = @"Masonry 示例";
    masonry.VcClass = [FYMasonryViewController class];
    [self.autoLayoutDeomArray addObject:masonry];

    // UIStackView
    FYVcModel *stackView = [[FYVcModel alloc] init];
    stackView.title = @"UIStackView 示例";
    stackView.VcClass = [FYStackViewViewController class];
    [self.autoLayoutDeomArray addObject:stackView];
    
    FYVcModel *stackViewAndAutoLayout = [[FYVcModel alloc] init];
    stackViewAndAutoLayout.title = @"UIStackView + AutoLayout 示例";
    stackViewAndAutoLayout.VcClass = [FYStackViewAndAutoLayoutController class];
    [self.autoLayoutDeomArray addObject:stackViewAndAutoLayout];
    
}

- (void)p_createAutoLayoutKeyKnowledgeArray
{
    // AlignmentRect
    FYVcModel *AlignmentRect = [[FYVcModel alloc] init];
    AlignmentRect.title = @"对齐矩形AlignmentRect";
    AlignmentRect.VcClass = [FYAlignmentRectViewController class];
    [self.autoLayoutKeyKnowledgeArray addObject:AlignmentRect];
    
    // IntrinsicContentSize
    FYVcModel *IntrinsicContentSize = [[FYVcModel alloc] init];
    IntrinsicContentSize.title = @"内在内容大小IntrinsicContentSize";
    IntrinsicContentSize.VcClass = [FYIntrinsicContentSizeViewController class];
    [self.autoLayoutKeyKnowledgeArray addObject:IntrinsicContentSize];
    
    // LayoutProcess
    FYVcModel *LayoutProcess = [[FYVcModel alloc] init];
    LayoutProcess.title = @"布局周期LayoutProcess";
    LayoutProcess.VcClass = [FYLayoutProcessViewController class];
    [self.autoLayoutKeyKnowledgeArray addObject:LayoutProcess];
    
}




#pragma mark - UITableViewDataSource UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? self.autoLayoutDeomArray.count : self.autoLayoutKeyKnowledgeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FYVcModel *vcModel = indexPath.section == 0 ? self.autoLayoutDeomArray[indexPath.row] : self.autoLayoutKeyKnowledgeArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = vcModel.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FYVcModel *vcModel = indexPath.section == 0 ? self.autoLayoutDeomArray[indexPath.row] : self.autoLayoutKeyKnowledgeArray[indexPath.row];
    
    UIViewController *vc = nil;
    if ([vcModel.VcClass isSubclassOfClass:[FYViewController class]])
    {
        vc = [[vcModel.VcClass alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    UILabel *header = [[UILabel alloc] init];
    header.backgroundColor = [UIColor yellowColor];
    
    header.text = section == 0 ? @"Auto Layout多种使用方式演示" : @"Auto Layout关键知识分析";
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

@end

//
//  ViewController.m
//  TableViewDemo
//
//  Created by 张添 on 2017/9/7.
//  Copyright © 2017年 Tian Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZTCell.h"
#import "MJRefresh.h"

@interface ViewController ()
{
    int count;
}

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UItableView，style选择Grouped或Plain，这里我们以Grouped为例
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStyleGrouped];
    // 声明 tableView 的代理和数据源
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // 添加到 view 上
    [self.view addSubview:self.tableView];
    
    // 1.给UITableview添加下拉刷新和上拉加载；
    
    // 添加头部的下拉刷新
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    [header setRefreshingTarget:self refreshingAction:@selector(headerClick)];
    self.tableView.mj_header = header;
    
    // 添加底部的上拉加载
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setRefreshingTarget:self refreshingAction:@selector(footerClick)];
    self.tableView.mj_footer = footer;
}

// 2.实现下拉刷新和上拉加载的事件。

// 头部的下拉刷新触发事件
- (void)headerClick {
    // 可在此处实现下拉刷新时要执行的代码
    // ......
    
    // 模拟延迟3秒
    [NSThread sleepForTimeInterval:3];
    // 结束刷新
    [self.tableView.mj_header endRefreshing];
}

// 底部的上拉加载触发事件
- (void)footerClick {
    // 可在此处实现上拉加载时要执行的代码
    // ......
    
    // 模拟延迟3秒
    [NSThread sleepForTimeInterval:3];
    // 结束刷新
    [self.tableView.mj_footer endRefreshing];
}

// tableView 中 Section 的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 100;
}

// 每个 Section 中的 Cell 个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

// 设置每个 Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    
    // 创建一个cellID，用于cell的重用
    NSString *cellID = @"cellID";
    // 从tableview的重用池里通过cellID取一个cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        // 如果tableview的重用池中没有取到，就创建一个新的cell，style为Value2，并用cellID对其进行标记。
        cell = [[ZTCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
        
        count++;
        NSLog(@"%d", count);
    }
    
//    // 设置 cell 的标题
//    cell.textLabel.text = [NSString stringWithFormat:@"这是第%li个cell", (long)indexPath.row];
//    // 设置 cell 的副标题
//    cell.detailTextLabel.text = @"副标题";
    
    return cell;
}

// 设置 section 的 header 高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
// 设置 section 的 footer 高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

// 设置 cell 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath");
    return 140;
}

// cell 的文字缩进
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 10;
}

// 自定义 section 的 header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    headerView.backgroundColor = [UIColor greenColor];
    return headerView;
}

// 自定义 section 的 footer
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    footerView.backgroundColor = [UIColor grayColor];
    return footerView;
}

// 选中了 cell 时触发
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了第%li个cell", (long)indexPath.row);
}

// 设置 cell 是否允许左滑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}
// 设置默认的左滑按钮的title
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"按钮钮钮";
}
// 点击左滑出现的按钮时触发
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击左滑出现的按钮时触发");
}
// 左滑结束时调用(只对默认的左滑按钮有效，自定义按钮时这个方法无效)
-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"左滑结束");
}

// 自定义左滑cell时的按钮和触发方法
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建第一个按钮和触发事件
    UITableViewRowAction *cellActionA = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"按钮-1" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        // 在此写点击按钮时的触发事件
        // ......
        NSLog(@"点击了 按钮-1");
    }];
    // 定义按钮的颜色
    cellActionA.backgroundColor = [UIColor greenColor];
    
    // 创建第二个按钮和触发事件
    UITableViewRowAction *cellActionB = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"按钮-2" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        // 在此写点击按钮时的触发事件
        // ......
        NSLog(@"点击了 按钮-2");
    }];
    // 注意这里返回的是一个按钮组，即使只定义了一个按钮也要返回一个组
    return @[cellActionA, cellActionB];
}

@end

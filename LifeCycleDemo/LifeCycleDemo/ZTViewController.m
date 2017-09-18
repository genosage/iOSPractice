//
//  ZTViewController.m
//  LifeCycleDemo
//
//  Created by 张添 on 2017/9/11.
//  Copyright © 2017年 Tian Zhang. All rights reserved.
//

#import "ZTViewController.h"
#import "ZTView.h"

@interface ZTViewController ()
{
    ZTView *ztView;
}
@end

@implementation ZTViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"addSubView" style:UIBarButtonItemStylePlain target:self action:@selector(addTestViewSubView)];
    self.navigationItem.rightBarButtonItem = item;
    
    ZTView *view = [[ZTView alloc] init];
    view.frame = CGRectMake(8, 100, self.view.bounds.size.width - 8*2, 250);
    view.backgroundColor = [UIColor colorWithRed:0.101 green:0.502 blue:0.427 alpha:1.000];
    [self.view addSubview:view];
    ztView = view;
    
}
- (void)addTestViewSubView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.tag = 100;
    [ztView addSubview:view];
    
}

@end

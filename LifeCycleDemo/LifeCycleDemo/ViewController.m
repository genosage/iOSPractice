//
//  ViewController.m
//  LifeCycleDemo
//
//  Created by 张添 on 2017/9/11.
//  Copyright © 2017年 Tian Zhang. All rights reserved.
//

#import "ViewController.h"
#import "ZTViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor colorWithRed:0.489 green:0.548 blue:0.898 alpha:1.000];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushZTViewVC:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)pushZTViewVC:(UIButton *)sender{
    ZTViewController *vc = [[ZTViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end

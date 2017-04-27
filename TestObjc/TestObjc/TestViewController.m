//
//  TestViewController.m
//  TestObjc
//
//  Created by 张添 on 27/4/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _testView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
    _testView.layer.shadowOffset = CGSizeMake(0,0);
    _testView.layer.shadowOpacity = 0.2;
    _testView.layer.shadowRadius = 4;
    _testView.layer.masksToBounds = YES;
    
    _testView.layer.cornerRadius = 6;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

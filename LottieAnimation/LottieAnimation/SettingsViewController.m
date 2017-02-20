//
//  SettingsViewController.m
//  LottieAnimation
//
//  Created by 张添 on 20/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *additionalMenuButton;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_additionalMenuButton setTarget:self.revealViewController];
    [_additionalMenuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

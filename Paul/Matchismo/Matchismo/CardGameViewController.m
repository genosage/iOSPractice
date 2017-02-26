//
//  CardGameViewController.m
//  Matchismo
//
//  Created by 张添 on 23/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)touchCardButton:(UIButton *)sender {
    UIImage *cardImage = [UIImage imageNamed:@"cardback"];
    [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    [sender setTitle:nil forState:UIControlStateNormal];
}


@end

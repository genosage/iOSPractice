//
//  ViewController.m
//  LottieAnimation
//
//  Created by 张添 on 19/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"

@interface ViewController ()
{
    BOOL menuOn;
    LOTAnimationView *hamburgerMenuButton;
    CGRect hamburgerMenuFrame;
}

- (void)addHamburgerButton:(BOOL)on;
- (IBAction)showAnimation:(UIButton *)sender;
- (void)addMenuToggleRecognizer;
- (void)toggleMenu:(UITapGestureRecognizer *)recognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    menuOn = false;
//    NSLog(@"%f", self.navigationItem.leftBarButtonItem.width);
//    NSLog(@"%lu", self.navigationItem.leftBarButtonItems.count);
    hamburgerMenuFrame = CGRectMake(0, 0, 75, 75);
    [self addHamburgerButton:menuOn];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


- (void)addHamburgerButton:(BOOL)on {
    if (hamburgerMenuButton != nil) {
        [hamburgerMenuButton removeFromSuperview];
        hamburgerMenuButton = nil;
    }
    
    NSString *animation = on ? @"buttonOff" : @"buttonOn";
    
    hamburgerMenuButton = [LOTAnimationView animationNamed:animation];
    [hamburgerMenuButton setUserInteractionEnabled:true];
    hamburgerMenuButton.frame = hamburgerMenuFrame;
    hamburgerMenuButton.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addMenuToggleRecognizer];
    
//    [self.view addSubview:hamburgerMenuButton];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:hamburgerMenuButton];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)addMenuToggleRecognizer{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleMenu:)];
    
    [tapRecognizer addTarget:self.revealViewController action:@selector(revealToggle:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    [hamburgerMenuButton addGestureRecognizer:tapRecognizer];
}

- (void)toggleMenu:(UITapGestureRecognizer *)recognizer {
    if (!menuOn) {
        [hamburgerMenuButton playWithCompletion:^(BOOL animationFinished) {
            menuOn = true;
            [self addHamburgerButton:menuOn];
        }];
    } else {
        [hamburgerMenuButton playWithCompletion:^(BOOL animationFinished) {
            menuOn = false;
            [self addHamburgerButton:menuOn];
        }];
    }
}

- (IBAction)showAnimation:(UIButton *)sender {
    LOTAnimationView *animationView = [LOTAnimationView animationNamed:@"PinJump"];
    animationView.frame = CGRectMake(0, 100, self.view.frame.size.width, 250);
    animationView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:animationView];
    animationView.loopAnimation = YES;
    [animationView play];
}

@end

//
//  ViewController.m
//  LottieAnimation
//
//  Created by 张添 on 19/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL menuOn;
    CGRect hamburgerMenuFrame;
    LOTAnimationView *hamburgerButton;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *additionalMenuButton;

@property (weak, nonatomic) IBOutlet UIView *hamburgerButtonView;

- (IBAction)showAnimation:(UIButton *)sender;
- (void)addHamburgerButton:(BOOL)on;
- (void)addMenuToggleRecognizer;
- (void)toggleMenu:(UITapGestureRecognizer *)recognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuOn = false;
    hamburgerMenuFrame = CGRectMake(-30, -18, 75, 75);
    _hamburgerButtonView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    
    [self addHamburgerButton:menuOn];
    
    [_additionalMenuButton setTarget:self.revealViewController];
    [_additionalMenuButton setAction:@selector(revealToggle:)];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


- (void)addHamburgerButton:(BOOL)on {
    if (hamburgerButton != nil) {
        [hamburgerButton removeFromSuperview];
        hamburgerButton = nil;
    }
    
    NSString *animation = on ? @"buttonOff" : @"buttonOn";
    
    hamburgerButton = [LOTAnimationView animationNamed:animation];
    [hamburgerButton setUserInteractionEnabled:true];
    hamburgerButton.frame = hamburgerMenuFrame;
    hamburgerButton.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addMenuToggleRecognizer];
    
    [_hamburgerButtonView addSubview:hamburgerButton];
}

- (void)addMenuToggleRecognizer{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toggleMenu:)];
    
    [tapRecognizer addTarget:self.revealViewController action:@selector(revealToggle:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    [hamburgerButton addGestureRecognizer:tapRecognizer];
}

- (void)toggleMenu:(UITapGestureRecognizer *)recognizer {
    if (!menuOn) {
        [hamburgerButton setAnimationSpeed:2.5];
        [hamburgerButton playWithCompletion:^(BOOL animationFinished) {
            menuOn = true;
            [self addHamburgerButton:menuOn];
        }];
    } else {
        [hamburgerButton setAnimationSpeed:1.5];
        [hamburgerButton playWithCompletion:^(BOOL animationFinished) {
            menuOn = false;
            [self addHamburgerButton:menuOn];
        }];
    }
}

- (IBAction)showAnimation:(UIButton *)sender {
    LOTAnimationView *animationView = [LOTAnimationView animationNamed:@"PinJump"];
    animationView.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width);
    animationView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:animationView];
    animationView.loopAnimation = YES;
    [animationView play];
}

@end

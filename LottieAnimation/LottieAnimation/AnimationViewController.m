//
//  ViewController.m
//  LottieAnimation
//
//  Created by 张添 on 19/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (weak, nonatomic) IBOutlet UIView *hamburgerButtonView;

- (IBAction)showAnimation:(UIButton *)sender;
- (void)addMenuToggleRecognizer;

@end


@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _hamburgerButtonView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    [self addHamburgerButton:NO];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
}

- (void)addHamburgerButton:(BOOL)on {
    if (_hamburgerButton != nil) {
        [_hamburgerButton removeFromSuperview];
        _hamburgerButton = nil;
    }
    
    NSString *animation = on ? @"buttonOff" : @"buttonOn";
    
    _hamburgerButton = [LOTAnimationView animationNamed:animation];
    [_hamburgerButton setUserInteractionEnabled:true];
    _hamburgerButton.frame = CGRectMake(-30, -18, 75, 75);
//    _hamburgerButton.leftAnchor
    _hamburgerButton.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addMenuToggleRecognizer];
    
    [_hamburgerButtonView addSubview:_hamburgerButton];
}

- (void)addMenuToggleRecognizer{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self.revealViewController action:@selector(revealToggle:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    [_hamburgerButton addGestureRecognizer:tapRecognizer];
}

- (IBAction)showAnimation:(UIButton *)sender {
    _animationView = [LOTAnimationView animationNamed:@"buttonOff"];
    _animationView.frame = CGRectMake(100, 200, 75, 75);
//    animationView.backgroundColor = [UIColor redColor];
    _animationView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_animationView];
//    animationView.loopAnimation = YES;
//    [animationView play];
}

@end

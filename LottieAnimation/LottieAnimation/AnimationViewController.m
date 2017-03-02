//
//  ViewController.m
//  LottieAnimation
//
//  Created by 张添 on 19/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
{
    CGRect hamburgerMenuFrame;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *additionalMenuButton;

@property (weak, nonatomic) IBOutlet UIView *hamburgerButtonView;

- (IBAction)showAnimation:(UIButton *)sender;
- (void)addMenuToggleRecognizer;
//- (void)toggleMenu:(UITapGestureRecognizer *)recognizer;

@end


@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.menuOn = NO;
    hamburgerMenuFrame = CGRectMake(-30, -18, 75, 75);
    _hamburgerButtonView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    [self addHamburgerButton:NO];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];

    [_additionalMenuButton setTarget:self.revealViewController];
    [_additionalMenuButton setAction:@selector(revealToggle:)];
    
//    [self addObserver:self forKeyPath:@"menuOn" options:0 context:nil];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    NSLog(@"%@", keyPath);
//}

- (void)addHamburgerButton:(BOOL)on {
    if (_hamburgerButton != nil) {
        [_hamburgerButton removeFromSuperview];
        _hamburgerButton = nil;
    }
    
    NSString *animation = on ? @"buttonOff" : @"buttonOn";
    
    _hamburgerButton = [LOTAnimationView animationNamed:animation];
    [_hamburgerButton setUserInteractionEnabled:true];
    _hamburgerButton.frame = hamburgerMenuFrame;
//    _hamburgerButton.leftAnchor
    _hamburgerButton.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addMenuToggleRecognizer];
    
//    UIView *containerView = [[UIView alloc]init];
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:containerView];
//    [leftButton.customView addSubview:_hamburgerButton];
//    
//    [self.navigationItem setLeftBarButtonItem:leftButton];
    
    [_hamburgerButtonView addSubview:_hamburgerButton];
}

- (void)addMenuToggleRecognizer{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self.revealViewController action:@selector(revealToggle:)];
    
//    [tapRecognizer addTarget:self.revealViewController action:@selector(revealToggle:)];
    
    tapRecognizer.numberOfTapsRequired = 1;
    
    [_hamburgerButton addGestureRecognizer:tapRecognizer];
}

//- (void)toggleMenu:(UITapGestureRecognizer *)recognizer {
//    if (!_menuOn) {
//        [_hamburgerButton setAnimationSpeed:2.5];
//        [_hamburgerButton play];
////        [_hamburgerButton playWithCompletion:^(BOOL animationFinished) {
////            menuOn = true;
////            [self addHamburgerButton:menuOn];
////        }];
//    } else {
//        [_hamburgerButton setAnimationSpeed:1.5];
//        [_hamburgerButton play];
////        [_hamburgerButton playWithCompletion:^(BOOL animationFinished) {
////            menuOn = false;
////            [self addHamburgerButton:menuOn];
////        }];
//    }
//}

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

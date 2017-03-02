//
//  ZTRevealViewController.m
//  LottieAnimation
//
//  Created by 张添 on 24/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "ZTRevealViewController.h"

@implementation ZTRevealViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self panGestureRecognizer];
    [self tapGestureRecognizer];
    
    self.delegate = self;
    
//    [self addObserver:self forKeyPath:@"frontViewPosition" options:0 context:nil];
    
//    NSLog(@"%ld\n", (long)self.frontViewPosition);
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    NSLog(@"!");
//}

- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position{
    AnimationViewController *animationController = self.frontViewController.childViewControllers.firstObject;
    if (position == FrontViewPositionRight) {
        [animationController.hamburgerButton setAnimationSpeed:3];
        [animationController.hamburgerButton playWithCompletion:^(BOOL animationFinished) {
//            animationController.menuOn = YES;
            [animationController addHamburgerButton:YES];
        }];
    } else if (position == FrontViewPositionLeft) {
        [animationController.hamburgerButton setAnimationSpeed:2];
        [animationController.hamburgerButton playWithCompletion:^(BOOL animationFinished) {
//            animationController.menuOn = NO;
            [animationController addHamburgerButton:NO];
        }];
    }
}


//- (void)revealController:(SWRevealViewController *)revealController panGestureMovedToLocation:(CGFloat)location progress:(CGFloat)progress overProgress:(CGFloat)overProgress{
//    AnimationViewController *animationController = self.frontViewController.childViewControllers.firstObject;
//    
//    if (progress > 1) {
//        progress = 1;
//    }
//    
//    if (!animationController.menuOn) {
//        [animationController.hamburgerButton setAnimationProgress:progress];
//        [animationController.animationView setAnimationProgress:(1 - progress)];
//    } else {
//        [animationController.hamburgerButton setAnimationProgress:(1-progress)];
//        [animationController.animationView setAnimationProgress: progress];
//    }
//}

@end

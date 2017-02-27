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

- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position{
    AnimationViewController *animationController = self.frontViewController.childViewControllers.firstObject;
    if (position == FrontViewPositionRight) {
        animationController.menuOn = true;
        [animationController addHamburgerButton:true];
    } else if (position == FrontViewPositionLeft) {
        animationController.menuOn = false;
        [animationController addHamburgerButton:false];
    }
}


- (void)revealController:(SWRevealViewController *)revealController panGestureMovedToLocation:(CGFloat)location progress:(CGFloat)progress overProgress:(CGFloat)overProgress{
    AnimationViewController *animationController = self.frontViewController.childViewControllers.firstObject;
    
    if (progress > 1) {
        progress = 1;
    }
    
    if (!animationController.menuOn) {
        [animationController.hamburgerButton setAnimationProgress:progress];
    } else {
        [animationController.hamburgerButton setAnimationProgress:(1-progress)];
    }
}

@end

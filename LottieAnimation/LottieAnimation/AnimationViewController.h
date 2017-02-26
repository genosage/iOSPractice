//
//  ViewController.h
//  LottieAnimation
//
//  Created by 张添 on 19/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "ZTRevealViewController.h"
#import <Lottie/Lottie.h>

@interface AnimationViewController : UIViewController

@property BOOL menuOn;
@property LOTAnimationView *hamburgerButton;

- (void)addHamburgerButton:(BOOL)on;

@end

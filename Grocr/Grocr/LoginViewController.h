//
//  LoginViewController.h
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate, GIDSignInDelegate, GIDSignInUIDelegate>

@end

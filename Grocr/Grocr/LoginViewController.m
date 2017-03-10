//
//  LoginViewController.m
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
  NSString *loginToList;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldLoginEmail;

@property (weak, nonatomic) IBOutlet UITextField *textFieldLoginPassword;

@property (weak, nonatomic) IBOutlet GIDSignInButton *signInButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    loginToList = @"LoginToList";
    self.textFieldLoginEmail.delegate = self;
    self.textFieldLoginPassword.delegate = self;
  
    [self.textFieldLoginEmail setText:@""];
    [self.textFieldLoginPassword setText:@""];
  
    [GIDSignIn sharedInstance].clientID =
    [FIRApp defaultApp].options.clientID;
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
  
    [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
//      NSLog(@"LoginViewController AuthState Run For Once!!!!");
      if (user != nil) {
        [self performSegueWithIdentifier:loginToList sender:nil];
      } else {
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Email or Password Not Correct!!!" preferredStyle:UIAlertControllerStyleAlert];
//        
//        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//        
//        [alert addAction:confirm];
//        
//        [self presentViewController:alert animated:YES completion:nil];
      }
    }];
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue {
  [_textFieldLoginEmail setText:@""];
  [_textFieldLoginPassword setText:@""];
  [_textFieldLoginEmail becomeFirstResponder];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
  
  if (error == nil) {
    GIDAuthentication *authentication = user.authentication;
    FIRAuthCredential *credential = [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken accessToken:authentication.accessToken];
    
    [[FIRAuth auth] signInWithCredential:credential completion:nil];
  }
  
}

- (IBAction)loginDidTouch:(UIButton *)sender {
    [[FIRAuth auth] signInWithEmail:_textFieldLoginEmail.text password:_textFieldLoginPassword.text completion:nil];
}

- (IBAction)signUpDidTouch:(UIButton *)sender {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Register" message:@"Register" preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    NSString *email = alert.textFields[0].text;
    NSString *password = alert.textFields[1].text;
    
    [[FIRAuth auth] createUserWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
      
      if (error == nil) {
        [[FIRAuth auth] signInWithEmail:email password:password completion:nil];
      }
      
    }];
    
  }];
  
  
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
  
  [alert addAction:saveAction];
  [alert addAction:cancelAction];
  
  [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textEmail) {
    [textEmail setPlaceholder:@"Enter your email"];
  }];
  
  [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textPassword) {
    [textPassword setSecureTextEntry:true];
    [textPassword setPlaceholder:@"Enter your password"];
  }];
  
  [self presentViewController:alert animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  if (textField == self.textFieldLoginEmail) {
    [self.textFieldLoginPassword becomeFirstResponder];
  }
  
  if (textField == self.textFieldLoginPassword) {
    [textField resignFirstResponder];
  }
  
  return YES;
}

@end

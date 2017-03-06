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

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    loginToList = @"LoginToList";
    self.textFieldLoginEmail.delegate = self;
    self.textFieldLoginPassword.delegate = self;
  
    [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
      if (user != nil) {
        [self performSegueWithIdentifier:loginToList sender:nil];
      }
    }];
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue {
    [[FIRAuth auth] signOut:nil];
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

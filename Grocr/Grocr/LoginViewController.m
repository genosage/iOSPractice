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
}

- (IBAction)loginDidTouch:(UIButton *)sender {
  [self performSegueWithIdentifier:loginToList sender:nil];
}
- (IBAction)signUpDidTouch:(UIButton *)sender {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Register" message:@"Register" preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:nil];
  
  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
  
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

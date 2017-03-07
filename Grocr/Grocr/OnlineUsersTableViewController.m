//
//  OnlineUsersTableViewController.m
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import "OnlineUsersTableViewController.h"

@interface OnlineUsersTableViewController ()
{
    NSString *userCell;
}

@property User *user;
@property FIRDatabaseReference *usersRef;

@end

@implementation OnlineUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    userCell = @"UserCell";
  
    _usersRef = [[FIRDatabase database] referenceWithPath:@"online"];
  
    _currentUsers = [[NSMutableArray alloc] init];
  
  [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
    if (user != nil) {
      _user = [[User alloc] initWithFIR:user];
    } else {
      FIRDatabaseReference *ref = [_usersRef child:_user.uid];
      [ref removeValue];
    }
  }];
  
    [_usersRef observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//      NSLog(@"OnlineUsersTableViewController _usersRefadd Run For Once!!!!");
      
      NSString *email = snapshot.value;
      [_currentUsers addObject:email];
      
      NSIndexPath * indexpath = [NSIndexPath indexPathForRow:(_currentUsers.count - 1) inSection:0];
      
      [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationTop];
      
    }];
  
    [_usersRef observeEventType:FIRDataEventTypeChildRemoved withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
      
      NSString *emailToFind = snapshot.value;

      [_currentUsers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *email = (NSString *)obj;
        
        if (email == emailToFind) {
          
          [_currentUsers removeObjectAtIndex:idx];
          
          NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
          [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
      }];
      
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_currentUsers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userCell forIndexPath:indexPath];
    
    cell.textLabel.text = _currentUsers[indexPath.row];
  
    return cell;
}

- (IBAction)signoutButtonPressed:(UIButton *)sender {
  [[FIRAuth auth] signOut:nil];
  [self dismissViewControllerAnimated:YES completion:nil];
}


@end

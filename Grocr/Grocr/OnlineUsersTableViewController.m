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

@end

@implementation OnlineUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    userCell = @"UserCell";
    _currentUsers = [[NSMutableArray alloc] init];
    [_currentUsers addObject:@"zhangtian1104@gmail.com"];
  
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

- (IBAction)signoutButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end

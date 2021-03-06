//
//  GroceryListTableViewController.m
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import "GroceryListTableViewController.h"

@interface GroceryListTableViewController ()
{
  NSString *listToUsers;
}

@property NSMutableArray *items;
@property User *user;
@property UIBarButtonItem *userCountBarButtonItem;
@property FIRDatabaseReference *ref;
@property FIRDatabaseReference *usersRef;

- (void)userCountButtonDidTouch;
- (void)toggleCellCheckbox:(UITableViewCell *)cell isCompleted:(BOOL)isCompleted;

@end

@implementation GroceryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    _ref = [[FIRDatabase database]referenceWithPath:@"grocery-items"];
    _usersRef = [[FIRDatabase database] referenceWithPath:@"online"];
  
    [self.tableView setAllowsMultipleSelectionDuringEditing:NO];
  
    listToUsers = @"ListToUsers";
    _items = [[NSMutableArray alloc]init];
  
  _userCountBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"0" style:UIBarButtonItemStylePlain target:self action:@selector(userCountButtonDidTouch)];
  
  [_userCountBarButtonItem setTintColor:[UIColor whiteColor]];
  
  [self.navigationItem setLeftBarButtonItem:_userCountBarButtonItem];
  
  [_ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//    NSLog(@"GroceryListTableViewController _ref Run For Once!!!!");
    NSMutableArray *newItems = [[NSMutableArray alloc]init];
    
    for (FIRDataSnapshot *item in snapshot.children) {
      GroceryItem *groceryItem = [[GroceryItem alloc] initWithSnapshot:item];
      [newItems addObject:groceryItem];
    }
  
    _items = newItems;
    [self.tableView reloadData];
  }];
  
  [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
//    NSLog(@"GroceryListTableViewController AuthState Run For Once!!!!");
    
    if (user != nil) {
      _user = [[User alloc] initWithFIR:user];
      
      FIRDatabaseReference *currentUserRef = [_usersRef child:_user.uid];
      [currentUserRef setValue:_user.email];
      [currentUserRef onDisconnectRemoveValue];
    }
    
  }];
  
  [_usersRef observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
//    NSLog(@"GroceryListTableViewController _usersRef Run For Once!!!!");
    if ([snapshot exists]) {
      [_userCountBarButtonItem setTitle:[@(snapshot.childrenCount) stringValue]];
    } else {
      [_userCountBarButtonItem setTitle:@"0"];
    }
  }];
  
}

- (void)userCountButtonDidTouch{
  [self performSegueWithIdentifier:listToUsers sender:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
  GroceryItem *groceryItem = [_items objectAtIndex:indexPath.row];
  cell.textLabel.text = groceryItem.name;
  cell.detailTextLabel.text = groceryItem.addedByUser;
  
  [self toggleCellCheckbox:cell isCompleted:groceryItem.completed];
  
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_items removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
      GroceryItem *groceryItem = [_items objectAtIndex:indexPath.row];
      [groceryItem.ref removeValue];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  
  GroceryItem *groceryItem = [_items objectAtIndex:indexPath.row];
  BOOL toggledCompletion = !groceryItem.completed;
  
  [self toggleCellCheckbox:cell isCompleted:toggledCompletion];
  [groceryItem.ref updateChildValues:(@{
                                        @"completed" : @(toggledCompletion)
                                        })];
}

- (void)toggleCellCheckbox:(UITableViewCell *)cell isCompleted:(BOOL)isCompleted{
  if (!isCompleted) {
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.textColor = [UIColor blackColor];
  } else {
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.textColor = [UIColor grayColor];
  }
}

- (IBAction)addButtonDidTouch:(UIBarButtonItem *)sender {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Grocery Item" message:@"Add an Item" preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    UITextField *textField = alert.textFields.firstObject;
    GroceryItem *groceryItem = [[GroceryItem alloc]initWithName:textField.text addedByUser:_user.email addedByUid:_user.uid completed:NO key:nil];
    
//    [_items addObject:groceryItem];
//    [self.tableView reloadData];
    
    FIRDatabaseReference *groceryItemRef = [_ref child:[textField.text lowercaseString]];
    [groceryItemRef setValue:[groceryItem toAnyObject]];
  }];

  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
  
  [alert addTextFieldWithConfigurationHandler:nil];
  [alert addAction:saveAction];
  [alert addAction:cancelAction];
  
  [self presentViewController:alert animated:YES completion:nil];
  
}

@end

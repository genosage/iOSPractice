//
//  OnlineUsersTableViewController.h
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <GoogleSignIn/GoogleSignIn.h>

@interface OnlineUsersTableViewController : UITableViewController

@property NSMutableArray *currentUsers;

@end

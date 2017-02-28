//
//  GroceryItem.h
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>

@interface GroceryItem : NSObject

@property NSString *key;
@property NSString *name;
@property NSString *addedByUser;
@property FIRDatabaseReference *ref;
@property BOOL completed;

- (id)initWithName:(NSString *)name addedByUser:(NSString *)addedByUser completed:(BOOL)completed key:(NSString *)key;

- (id)initWithSnapshot:(FIRDataSnapshot *)snapshot;

- (id)toAnyObject;

@end

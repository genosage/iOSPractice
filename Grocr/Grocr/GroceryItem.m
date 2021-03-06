//
//  GroceryItem.m
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

- (id)initWithName:(NSString *)name addedByUser:(NSString *)addedByUser addedByUid:(NSString *)addedByUid completed:(BOOL)completed key:(NSString *)key{
    self = [super init];
  
    _name = name;
    _key = key;
    _addedByUser = addedByUser;
    _addedByUid = addedByUid;
    _completed = completed;
    _ref = nil;
  
    return self;
}

- (id)initWithSnapshot:(FIRDataSnapshot *)snapshot{
    self = [super init];
  
    _key = snapshot.key;
    _name = snapshot.value[@"name"];
    _addedByUser = snapshot.value[@"addedByUser"];
    _addedByUid = snapshot.value[@"addedByUid"];
    _completed = [snapshot.value[@"completed"] boolValue];
    _ref = snapshot.ref;
  
    return self;
}

- (id)toAnyObject{
    return @{
             @"name" : _name,
             @"addedByUser" : _addedByUser,
             @"addedByUid" : _addedByUid,
             @"completed" : @(_completed)
             };
}

@end

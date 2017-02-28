//
//  User.m
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithFIR:(FIRUser *)authData{
    self = [super init];
  
    _uid = authData.uid;
    _email = authData.email;
  
    return self;
}

- (id)initWithUid:(NSString *)uid andEmail:(NSString *)email{
    self = [super init];
  
    _uid = uid;
    _email = email;
  
    return self;
}

@end

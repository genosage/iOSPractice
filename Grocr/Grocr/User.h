//
//  User.h
//  Grocr
//
//  Created by 张添 on 28/2/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>

@interface User : NSObject

@property NSString *uid;
@property NSString *email;

- (id)initWithFIR:(FIRUser *)authData;
- (id)initWithUid:(NSString *)uid andEmail:(NSString *)email;

@end

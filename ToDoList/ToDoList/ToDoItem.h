//
//  ToDoItem.h
//  ToDoList
//
//  Created by 张添 on 17/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property NSDate *creationDate;

@end

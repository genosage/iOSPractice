//
//  PrintClass.m
//  TestObjc
//
//  Created by 张添 on 15/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrintClass.h"
#import "PrintProtocolDelegate.h"

@implementation PrintClass

- (void)printDetails
{
    NSLog(@"Printing Details");
    [delegate processCompleted];
}

- (void)setDelegate:(id)newDelegate
{
    delegate = newDelegate;
}

@end

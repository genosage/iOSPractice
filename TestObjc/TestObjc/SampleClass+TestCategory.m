//
//  SampleClass+TestCategory.m
//  TestObjc
//
//  Created by 张添 on 15/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "SampleClass+TestCategory.h"

@implementation SampleClass (TestCategory)

- (int)test:(int)a {
    return a;
}

- (NSString *)returnTestText:(int)testNum
{
    NSString *result = [NSString stringWithFormat:@"Test is: %d\n", testNum];
    return result;
}

@end

//
//  Header.h
//  TestObjc
//
//  Created by 张添 on 13/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "PrintClass.h"
#import "PrintProtocolDelegate.h"

typedef void (^VoidBlock)();

@interface SampleClass:NSObject<PrintProtocolDelegate>

- (void)startAction;
- (double)getAverage:(int *)arr ofSize:(int)size;
- (void)getSeconds:(int *)ptr;
- (NSNumber *)multiply:(NSNumber *)num1 withNum2:(NSNumber *)num2;
- (void)testBlock:(VoidBlock)voidBlock;
- (int)max:(int)num1 andNum2:(int)num2;
- (void)sampleMethod;

@end

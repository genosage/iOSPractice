//
//  SampleClass.m
//  TestObjc
//
//  Created by 张添 on 13/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "SampleClass.h"
#import "SampleClass_TestExtension.h"

@implementation SampleClass

- (void)startAction
{
    PrintClass *printClass = [[PrintClass alloc]init];
    [printClass setDelegate:self];
    [printClass printDetails];
}

- (void)processCompleted
{
    NSLog(@"Printing Process Completed");
}

- (double)getAverage:(int *)arr ofSize:(int)size
{
    int sum = 0;
    double avg;
    
    for (int i = 0; i < size; i++)
    {
        sum += arr[i];
    }
    
    avg = (double) sum / size;
    return avg;
}

- (void)getSeconds:(int *)ptr
{
    *ptr = time(NULL);
}

- (NSNumber *)multiply:(NSNumber *)num1 withNum2:(NSNumber *)num2
{
    double n1 = [num1 doubleValue];
    double n2 = [num2 doubleValue];
    NSNumber *result = [NSNumber numberWithDouble:(n1 * n2)];
    return result;
}

- (void)testBlock:(VoidBlock)voidBlock
{
    NSLog(@"Start to test Block\n");
    voidBlock();
}

- (int)max:(int)num1 andNum2:(int)num2
{
    return num1 > num2 ? num1 : num2;
}

- (void)sampleMethod
{
    NSLog(@"Hello, World! \n");
}

- (void)setStr:(NSString *)rStr
{
    str = rStr;
}

- (NSString *)getStr
{
    return str;
}

@end


//@implementation SampleClass ()
//
//Only once.
//
//@end

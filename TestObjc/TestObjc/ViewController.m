//
//  ViewController.m
//  TestObjc
//
//  Created by 张添 on 13/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "ViewController.h"

#define LENGTH 5
#define NEWLINE '\n'

@interface ViewController ()

@end

@implementation ViewController

extern float f;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SampleClass *sampleClass = [[SampleClass alloc]init];

//    const int WIDTH = 10;
//    [sampleClass sampleMethod];
//    NSLog(@"The max is: %d", [sampleClass max:LENGTH andNum2:WIDTH]);

//    NSLog(@"Size of long is: %lu", sizeof(long));
//    float f = 70.0/3.0;
//    NSLog(@"Value of f is: %f", f);
//    NSLog(@"The value is:%c%d", NEWLINE, LENGTH * WIDTH);
    
//    int (^multiply1)(int, int) =
//    ^(int num1, int num2) {
//        return num1 * num2;
//    };
//    NSLog(@"The result is: %d\n", multiply1(3, 5));
    
//    [sampleClass testBlock:^{
//        NSLog(@"This is the Block");
//    }];
    
//    NSNumber *num1 = [NSNumber numberWithDouble:11.4];
//    NSNumber *num2 = [NSNumber numberWithDouble:10.2];
//    NSNumber *result = [sampleClass multiply:num1 withNum2:num2];
//    NSString *resultString = [result stringValue];
//    NSLog(@"The result is: %@", resultString);
    
//    NSString *(^processBlock)(NSNumber *num) =
//    ^NSString *(NSNumber *num1) {
//        NSNumber *num2 = [NSNumber numberWithDouble:11.4];
//        NSNumber *result = [sampleClass multiply:num1 withNum2:num2];
//        NSString *resultString = [result stringValue];
//        return resultString;
//    };
    
//    NSNumber *nums[10];
//    for (int i = 0; i < 10; i++)
//    {
//        nums[i] = [NSNumber numberWithDouble:i];
//        NSLog(@"%@\n", processBlock(nums[i]));
//    }
    
//    float testPtr = 11.04;
//    float *ptr = &testPtr;
//    NSLog(@"The address is: %x\n", ptr);
//    NSLog(@"The value is: %f\n", *ptr);
    
//    int arr[3] = {1,2,3};
//    int *ptr = arr;
//    NSLog(@"The address is: %x\n", ptr);
//    NSLog(@"The value is: %d\n", *ptr);
//    ptr += 1; // ptr++
//    NSLog(@"The address is: %x\n", ptr);
//    NSLog(@"The value is: %d\n", *ptr);
    
//    char *name = "abc";
//    NSLog(@"%s", name);
    
//    int sec = 0;
//    [sampleClass getSeconds:&sec];
//    NSLog(@"The second is: %d", sec);
    
//    int arr[] = {5,7,12};
//    float avg = [sampleClass getAverage:arr ofSize:3];
//    NSLog(@"The average is: %f\n", avg);
    
//    NSLog(@"%@", [sampleClass returnTestText:13]);
//    [sampleClass setStr:@"Test of Extension\n"];
//    NSLog(@"%@", [sampleClass getStr]);
//    [sampleClass startAction];
    
//    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
//                             @"Opel", @"Volkswagen", @"Audi"];
//    NSArray *ukMakes = [NSArray arrayWithObjects:@"Aston Martin",
//                        @"Lotus", @"Jaguar", @"Bentley", nil];
//    NSMutableArray *brokenCars = [NSMutableArray arrayWithObjects:
//                                  @"Audi A6", @"BMW Z3",
//                                  @"Audi Quattro", @"Audi TT", nil];
//    
//    NSLog(@"First german make: %@", germanMakes[0]);
//    NSLog(@"First U.K. make: %@", [ukMakes objectAtIndex:0]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  Child.m
//  TestObjc
//
//  Created by 张添 on 2017/8/6.
//  Copyright © 2017年 Tian Zhang. All rights reserved.
//

#import "Child.h"

@implementation Child

+ (void)load {
    NSLog(@"Child load");
}
+ (void)initialize {
    NSLog(@"Child initialize");
}

@end

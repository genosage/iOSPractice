//
//  SampleClass+TestCategory.h
//  TestObjc
//
//  Created by 张添 on 15/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "SampleClass.h"

@interface SampleClass (TestCategory)

- (NSString *)returnTestText:(int)testNum;

@end
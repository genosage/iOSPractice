//
//  PrintClass.h
//  TestObjc
//
//  Created by 张添 on 15/2/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

@interface PrintClass :NSObject
{
    id delegate;
}

- (void)printDetails;
- (void)setDelegate:(id)newDelegate;

@end

#import "PrintClass.h"

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

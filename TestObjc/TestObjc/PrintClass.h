#import <Foundation/Foundation.h>

@protocol PrintProtocolDelegate <NSObject>

- (void)processCompleted;

@end

@interface PrintClass :NSObject
{
    id delegate;
}

- (void)printDetails;
- (void)setDelegate:(id)newDelegate;

@end

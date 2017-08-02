#import "RuntimeViewController.h"

@interface RuntimeViewController ()

//@property (nonatomic, weak) id obj;

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    dispatch_queue_t queue;
//    queue = dispatch_queue_create("com.test.gcd.queue", DISPATCH_QUEUE_SERIAL);
//    
//    dispatch_async(queue, ^{
//        NSLog(@"!");
//    });
//    
//    dispatch_release(queue);
    
//    @autoreleasepool {
//        id obj = [[NSObject alloc] init];
//        id __weak obj1 = obj;
//        NSLog(@"%@", obj1);
//    }
    
//    NSObject __autoreleasing *error = [[NSObject alloc] init];
//    NSObject *__autoreleasing *pError = &error;
//    printf(*error);
//    NSLog(@"%d", pError);
    
    
}

- (void)test {
}

- (BOOL)test:(BOOL)b {
    return b;
}

- (BOOL)test:(BOOL)b a:(int)a {
    return b;
}

@end

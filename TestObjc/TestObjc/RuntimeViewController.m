#import "RuntimeViewController.h"

@interface RuntimeViewController ()

//@property (nonatomic, weak) id obj;

//@property (nonatomic) NSMutableString *mutableStr;

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSMutableString *mutableStr1 = [NSMutableString stringWithFormat:@"123"];
//    self.mutableStr = [mutableStr1 mutableCopy];
//    
//    [mutableStr1 appendString:@"456"];
//    
//    NSLog(@"%@", self.mutableStr);
    
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
    
    
//    id array;
//    
//    @autoreleasepool {
//        array = [NSMutableArray array];
//        NSLog(@"%@", array);
//    }
//    
//    NSLog(@"%@", array);
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

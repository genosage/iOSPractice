#import "BlockViewController.h"
//#import "Child.h"

//typedef int (^add)(int, int);

@interface BlockViewController ()
//{
//    int v;
//}

//@property (assign) NSObject *obj;
//@property (nonatomic, readonly) int value;

@end

@implementation BlockViewController

//@synthesize value = _value;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *aString = [[NSData alloc] init];
//    NSNumber *aNumber = [NSString new];
//    UIImageView *a = [NSArray new];
//    NSLog(@"%@", [a class]);
    
    
    
    
//    [self myMethod:@"123"];
//    Child *child = [Child new];
}


//- (void)myMethod:(NSString *)string {
//    ^{NSLog(@"%@", string);}();
//}






//    [self setValue:@1 forKey:@"v"];
//    NSLog(@"%d", v);
    
//    NSObject *obj1 = [[NSObject alloc] init];
//    NSObject *obj2 = [[NSObject alloc] init];
//    NSObject *obj3 = [[NSObject alloc] init];
//    
//    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:obj1, obj2, obj3, NULL];
//    
//    NSLog(@"%lu", (unsigned long)[arr count]);
//    NSLog(@"%@", arr);
    
//    NSString *str = @"";
//    
//    if (str == nil) {
//        NSLog(@"123");
//    }

//- (void)setValue:(int)aValue
//{
//    NSLog(@"!!!");
//    _value = aValue;
//}
    
//    NSArray *arr = [NSArray array];
//    NSObject *obj = nil;
//    
//    @autoreleasepool {
//        [self testObj:&obj];
//        NSLog(@"%@", obj);
//    }
//    
//    NSLog(@"%@", obj);
    
//    [self setA:2];
//    NSLog(@"%d", self.a);

//- (void)testObj:(NSObject **)obj {
//    *obj = [[NSObject alloc] init];
//}

//- (int) value
//{
//    @synchronized(self) {
//        return _value;
//    }
//}
//

//- (int)a {
//    @synchronized (self) {
//        return 0;
//    }
//}

//- (void)setA:(int)a {
//    _a = a;
//}


//    void (^aBlock)(void) = nil;
//    if (!aBlock) {
//        aBlock = ^{ printf("hehe"); };
//    }
//    aBlock();
    
//    NSArray *arr;
//    
//    {
//        NSString *str = @"456";
//        arr = [NSArray arrayWithObject:str];
//    };
//    
//    NSLog(@"%@", [arr objectAtIndex:0]);
    
//    id obj = [self getBlockArray];
//    
//    typedef void (^blk_t) (void);
//    
//    blk_t blk = (blk_t)[obj objectAtIndex:0];
//    
//    blk();
    
//    NSObject *obj1 = [[NSObject alloc] init];
//    _obj = obj1;
//    obj1 = nil;
//    
//    NSLog(@"%@", _obj);
//    
//    [self func:^int(int a, int b) {
//        return a + b;
//    } a:1 b:2];
    
//    for (int i = 0; i< 100; i++) {
//        NSLog(@"%d");
//    }
    
//    for (int i = 0; i< 100; i++) {
//        [self func];
//    }

//- (id)getBlockArray {
//    int val = 10;
//    
//    return  [[NSArray alloc] initWithObjects:
//             [^{NSLog(@"blko: %d", val);} copy],
//             [^{NSLog(@"blk1: %d", val);} copy], nil];
//}

//- (void)func:(add)add a:(int)a b:(int)b {
//    int c = add(a, b);
//    NSLog(@"%d", c);
//}

//- (void)func {
//    static int a = 0;
//    a++;
//    NSLog(@"%d", a);
//}

@end

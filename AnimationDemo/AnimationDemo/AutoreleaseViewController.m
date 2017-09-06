#import "AutoreleaseViewController.h"
#import "Obj.h"

@interface AutoreleaseViewController ()

@end

@implementation AutoreleaseViewController

__weak id reference;

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSString *str = @"123456";
//    NSString *str1 = [str mutableCopy];
    
    __autoreleasing id str = [NSString stringWithFormat:@"测试"];
    reference = str;
    
    NSLog(@"1: %@", reference);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"2: %@", reference);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"3: %@", reference);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"4: %@", reference);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"5: %@", reference);
}


@end

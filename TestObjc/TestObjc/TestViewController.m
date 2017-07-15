//
//  TestViewController.m
//  TestObjc
//
//  Created by 张添 on 27/4/17.
//  Copyright © 2017 Tian Zhang. All rights reserved.
//

#import "TestViewController.h"
#import "pthread.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testThread];
    
    // Do any additional setup after loading the view.
    
//    _testView.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1].CGColor;
//    _testView.layer.shadowOffset = CGSizeMake(0,0);
//    _testView.layer.shadowOpacity = 0.2;
//    _testView.layer.shadowRadius = 4;
//    _testView.layer.masksToBounds = YES;
//    _testView.layer.cornerRadius = 6;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testThread {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 30);
    [btn setTitle:@"pThread" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(clickPThread) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(100, 100, 100, 30);
    [btn1 setTitle:@"NSThread" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [btn1 addTarget:self action:@selector(clickNSThread) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(100, 200, 100, 30);
    [btn2 setTitle:@"GCD" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn2 addTarget:self action:@selector(clickGCD) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame = CGRectMake(100, 200, 100, 30);
    [btn3 setTitle:@"Operation" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn3 addTarget:self action:@selector(clickOperation) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn3];
}

#pragma mark - pThread Test

- (void)clickPThread {
    NSLog(@"In main Thread!");
    
    pthread_t pthread;
    pthread_create(&pthread, NULL, run, NULL);
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"main: %d", i);
        sleep(1);
    }
}

void *run (void *data) {
    NSLog(@"In child Thread!");
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"child: %d", i);
        sleep(1);
    }
    
    return NULL;
}

#pragma mark - NSThread Test

- (void)clickNSThread {
    NSLog(@"In main Thread!");
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runThread) object:nil];
    
    [thread setName:@"Child_Thread1"];
    [thread setThreadPriority:0.9];
    [thread start];
    
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(runThread) object:nil];
    
    [thread1 setName:@"Child_Thread2"];
    [thread1 setThreadPriority:0.1];
    [thread1 start];
    
//    [NSThread detachNewThreadSelector:@selector(runThread) toTarget:self withObject:nil];
    
//    [self performSelectorInBackground:@selector(runThread) withObject:nil];
    
//    for (int i = 0; i < 10; i++) {
//        NSLog(@"main: %d", i);
//        sleep(1);
//    }
}

- (void)runThread {
    NSLog(@"In %@!", [[NSThread currentThread] name]);
    
    for (int i = 0; i < 10; i++) {
        NSLog(@"child: %d", i);
//        sleep(1);
    }
}

- (void)clickGCD {
    NSLog(@"Begin GCD!");
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"Start task1!");
//        [NSThread sleepForTimeInterval:3];
//        NSLog(@"Finish task1!");
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"Update UI!");
//        });
//    });
    
    dispatch_queue_t queue = dispatch_queue_create("com.test.gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"Start request1!");
        [self sendRequest1:^{
            NSLog(@"Finish request1!");
        }];
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"Start request2!");
        [self sendRequest2:^{
            NSLog(@"Finish request2!");
        }];
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"All tasks over");
    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"delay execute");
//    });
    
}

- (void)sendRequest1:(void(^)())block {
    NSLog(@"Start task1!");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"Finish task1!");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
}

- (void)sendRequest2:(void(^)())block {
    NSLog(@"Start task2!");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"Finish task2!");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    });
}

- (void)clickOperation {
    NSLog(@"Begin NSOperation!");
    
    [self performSelector:@selector(invocationAction) withObject:nil afterDelay:3];
    
//    NSBlockOperation *blockOper = [NSBlockOperation blockOperationWithBlock:^{
//        NSLog(@"Start task1!");
//        [NSThread sleepForTimeInterval:3];
//        NSLog(@"Finish task1!");
//    }];
//    
//    [blockOper start];
//    
//    NSInvocationOperation *invocationOper = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationAction) object:nil];
//    
//    [invocationOper start];
}


-(void)invocationAction {
    NSLog(@"Start task2!");
    [NSThread sleepForTimeInterval:3];
    NSLog(@"Finish task2!");
}

@end

#import "ViewController.h"
#import "ZTView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZTView *touchView = [[ZTView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    
    touchView.backgroundColor = [UIColor blueColor];
    
    touchView.layer.cornerRadius = 6;
    touchView.layer.shadowColor = [UIColor blackColor].CGColor;
    touchView.layer.shadowOffset = CGSizeMake(3, 3);
    touchView.layer.shadowOpacity = 0.3;
    touchView.layer.shadowRadius = 4;
    
    [self.view addSubview:touchView];
}


@end

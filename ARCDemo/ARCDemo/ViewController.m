#import "ViewController.h"

@interface ViewController ()

@property (weak) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.name = [[NSString alloc] init];
    
    /*
    NSMutableString *string = [NSMutableString stringWithFormat:@"Josh"];
    
    self.name = string;
    
    [string appendString:@"ua"];
    
    NSLog(@"%@", self.name);
    
    NSLog(@"%@", string);
    */
    
}

@end

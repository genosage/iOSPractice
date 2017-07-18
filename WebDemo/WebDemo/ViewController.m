#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.776 green:0.776 blue:0.8 alpha:1.0];

    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 34, self.view.frame.size.width - 2 * 20 - 60, 44)];
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _searchButton.frame = CGRectMake(_searchBar.frame.origin.x + _searchBar.frame.size.width + 10, 41, 60, 30);
    [_searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [_searchButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _searchButton.layer.cornerRadius = 5;
    _searchButton.layer.borderColor = [UIColor blackColor].CGColor;
    _searchButton.layer.borderWidth = 1;
    [_searchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 85, self.view.frame.size.width, self.view.frame.size.height - 85)];
    _webView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_webView];
    
    
//    NSURL *url = [NSURL URLWithString:@"http://www.imooc.com"];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//    
//    [connection start];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSURL *url = [NSURL URLWithString:_searchBar.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [searchBar resignFirstResponder];
}

- (void)searchAction {
    NSURL *url = [NSURL URLWithString:_searchBar.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [_searchBar resignFirstResponder];
}
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
//    NSLog(@"%@", response);
//}

@end

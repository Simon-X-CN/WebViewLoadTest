//
//  OriginRequestVC.m
//  webViewLoadTest
//
//  Created by Simon_X on 2018/7/21.
//  Copyright © 2018年 Simon_X_CN. All rights reserved.
//

#import "OriginRequestVC.h"
#import <WebKit/WebKit.h>

@interface OriginRequestVC ()<WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation OriginRequestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    
    [self.view addSubview:self.webView];
}

#pragma mark - Delegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    puts("didStartProvisional");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    printf("didCommit ");
    [TimeManager refreshTime];
    [TimeManager show];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    printf("didFinish ");
    [TimeManager refreshTime];
    [TimeManager show];
}
@end

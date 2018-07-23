//
//  DownMoveVC.m
//  webViewLoadTest
//
//  Created by Simon_X_CN on 2018/7/23.
//  Copyright © 2018年 Simon_X_CN. All rights reserved.
//

#import "DownMoveVC.h"
#import <WebKit/WebKit.h>

@interface DownMoveVC ()<WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation DownMoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    [self.view addSubview:self.webView];
    
    [self download];
}

- (void)download {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *name = [self.url md5];
        NSString *path = [NSString stringWithFormat:@"%@/%@.html",
                          [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject],
                          name
                          ];
        NSURL *urlPath = [NSURL fileURLWithPath:path];
        
        NSURL *url = [NSURL URLWithString:self.url];
        NSURLRequest * urlRequest = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
        
        NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:urlRequest completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            [session finishTasksAndInvalidate];
            
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:urlPath error:nil];
            NSString *htmlStr = [NSString stringWithContentsOfURL:urlPath encoding:NSUTF8StringEncoding error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.webView loadHTMLString:htmlStr baseURL:url];
            });
        }];
        [task resume];
    });
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

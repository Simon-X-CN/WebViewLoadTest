//
//  ViewController.m
//  webViewLoadTest
//
//  Created by Simon_X_CN on 2018/7/21.
//  Copyright © 2018年 Simon_X_CN. All rights reserved.
//

#import "ViewController.h"
#import "OriginRequestVC.h"
#import "DownloadTaskVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.url = @"https://github.com/";
    
    NSArray *txtAry = @[@"Just Request", @"NSURLSessionDownloadTask"];
    
    NSInteger idx = 0;
    for (NSString *title in txtAry) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50*idx + 88, ScreenWidth, 50)];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(choseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = idx++;
        [self.view addSubview:btn];
    }
}

- (void)choseBtnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 0: {
            [TimeManager refreshTime];
            OriginRequestVC *vc = [[OriginRequestVC alloc] init];
            vc.url = self.url;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            [TimeManager refreshTime];
            DownloadTaskVC *vc = [[DownloadTaskVC alloc] init];
            vc.url = self.url;
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}
@end

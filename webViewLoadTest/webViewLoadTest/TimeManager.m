//
//  TimeManager.m
//  webViewLoadTest
//
//  Created by Simon_X on 2018/7/21.
//  Copyright © 2018年 Simon_X_CN. All rights reserved.
//

#import "TimeManager.h"

@implementation TimeManager
+ (void)refreshTime {
    lstTime = nowTime;
    nowTime = [[NSDate date] timeIntervalSince1970];
}
+ (void)show {
    printf("%lf s\n", nowTime - lstTime);
}
@end

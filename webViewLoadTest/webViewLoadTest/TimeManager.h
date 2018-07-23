//
//  TimeManager.h
//  webViewLoadTest
//
//  Created by Simon_X on 2018/7/21.
//  Copyright © 2018年 Simon_X_CN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ScreenHeight   [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth    [[UIScreen mainScreen] bounds].size.width

static double lstTime;
static double nowTime;

@interface TimeManager : NSObject
+ (void)refreshTime;
+ (void)show;
@end

//
//  ZPMacro.h
//  ZPCoreToolsComponent
//
//  Created by CodeZP on 2019/4/30.
//  Copyright © 2019 CodeZP. All rights reserved.
//

#ifndef ZPMacro_h
#define ZPMacro_h

#pragma mark ---------------
#pragma mark 设备相关

//----------------是否是X类型设备-----------------
#define KiPhoneXSeries (([[UIApplication sharedApplication] statusBarFrame].size.height == 44.0f) ? (YES):(NO))

//----------------屏幕宽高-----------------
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//----------------状态栏、nav、tabbar高度-----------------
#define Height_StatusBar ((IS_IPHONE_X == YES || IS_IPHONE_Xr == YES || IS_IPHONE_Xs == YES || IS_IPHONE_Xs_Max == YES) ? 44.0 : 20.0)
#define NavBarHeight  (KiPhoneXSeries?88.0:64.0)
#define LDTabBarHeight (KiPhoneXSeries?83.0:49.0)

//----------------设备类型-----------------
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//----------------计算代码运行时间-----------------
#define START_TIMER NSDate *startTime = [NSDate date];
#define END_TIMER NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);

#pragma mark ---------------
#pragma mark 打印宏定义
//--------------打印-------------
#define ZPLog(format, ...) do {                                                                          \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
\
} while (0)

#if DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define LDLog {}
#define NSLog(...)
#endif

#pragma mark ---------------
#pragma mark 是否自动调节scrollview内容显示
//--------------是否自动调节scrollview内容显示-------------
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
if ([scrollView isKindOfClass:[UIScrollView class]]){\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
}\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
vc.edgesForExtendedLayout = UIRectEdgeAll;\
} while (0)

#endif /* ZPMacro_h */

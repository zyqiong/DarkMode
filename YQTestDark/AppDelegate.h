//
//  AppDelegate.h
//  YQTestDark
//
//  Created by zyqiong on 2019/12/3.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YQTabBarController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) YQTabBarController *rootTabBarController;

@end


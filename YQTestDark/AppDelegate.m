//
//  AppDelegate.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/3.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "AppDelegate.h"

#import "YQFirstViewController.h"
#import "YQSecondViewController.h"
#import "YQThirdViewController.h"

#import "YQTabBarController.h"

@interface AppDelegate ()<
UITabBarControllerDelegate
>

@property (nonatomic, strong) YQFirstViewController *firstViewController;
@property (nonatomic, strong) YQSecondViewController *secondViewController;
@property (nonatomic, strong) YQThirdViewController *thirdViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self buildTabBarController];
    return YES;
}

- (void)buildTabBarController {
    YQTabBarController *rootTabBarController = [[YQTabBarController alloc]init];
    
    NSArray *viewControllers = @[
                                 [[UINavigationController alloc] initWithRootViewController:self.firstViewController],
                                 [[UINavigationController alloc] initWithRootViewController:self.secondViewController],
                                 [[UINavigationController alloc] initWithRootViewController:self.thirdViewController]
                                 ];
    rootTabBarController.viewControllers = viewControllers;
    rootTabBarController.delegate = self;

    self.rootTabBarController = rootTabBarController;
    //
//    if (@available(iOS 13.0, *)) {
//        [self.rootTabBarController setOverrideUserInterfaceStyle:UIUserInterfaceStyleLight];
//    }
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = rootTabBarController;
//    if (@available(iOS 13.0, *)) {
//        [self.window setOverrideUserInterfaceStyle:UIUserInterfaceStyleLight];
//    }
    [self.window makeKeyAndVisible];
}


- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UIViewController*)viewController {

    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

- (YQFirstViewController *)firstViewController {
    if (_firstViewController == nil) {
        _firstViewController = [[YQFirstViewController alloc] init];
    }
    return _firstViewController;
}

- (YQSecondViewController *)secondViewController {
    if (_secondViewController == nil) {
        _secondViewController = [[YQSecondViewController alloc] init];
    }
    return _secondViewController;
}
- (YQThirdViewController *)thirdViewController {
    if (_thirdViewController == nil) {
        _thirdViewController = [[YQThirdViewController alloc] init];
    }
    return _thirdViewController;
}
@end

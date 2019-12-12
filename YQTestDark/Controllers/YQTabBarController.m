//
//  YQTabBarController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/5.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQTabBarController.h"

@interface YQTabBarController ()

@end

@implementation YQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupImages];
}

- (void)setupImages {
    NSArray *imageNames = @[@"btn_home", @"btn_new", @"btn_mine"];
    NSInteger count = self.tabBar.items.count;
    for (int i = 0; i < count; i ++) {
        UIImage *img = [[UIImage imageNamed:imageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = self.tabBar.items[i];
        item = [item initWithTitle:@"" image:img selectedImage:img];
    }
}

- (UIColor *)getUnselectedTabBarColor {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return [UIColor yellowColor];
            } else {
                return [UIColor blueColor];
            }
        }];
        return color;
    } else {
        return [UIColor yellowColor];
    }
}
@end

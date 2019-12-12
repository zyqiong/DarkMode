//
//  YQPresentViewController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/5.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQPresentViewController.h"

@interface YQPresentViewController ()

@end

@implementation YQPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [self getBackColor];
    
    [self addCloseBtn];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addCloseBtn {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 50)];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (UIColor *)getBackColor {
    if (@available(iOS 13.0, *)) {
        UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return [UIColor lightGrayColor];
            } else {
                return [UIColor blackColor];
            }
        }];
        return color;
    } else {
        return [UIColor blueColor];
    }
}
@end

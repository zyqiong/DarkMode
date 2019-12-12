//
//  YQMenuController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/6.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQMenuController.h"

@interface YQMenuController ()

@end

@implementation YQMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yqMainColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 290, 40)];
    if (@available(iOS 13.0, *)) {
        label.textColor = [UIColor labelColor];
    } else {
        label.textColor = [UIColor redColor];
    }
    label.text = @"这个一个UIViewController";
    [self.view addSubview:label];
}


@end

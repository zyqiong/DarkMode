//
//  YQFirstViewController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/3.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQFirstViewController.h"

#import "YQSystemColorViewController.h"

@interface YQFirstViewController ()

@end

@implementation YQFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yqbackColor];

    [self addViews];
    
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"收到模式改变的回调~~ 改变前的模式：%@",(long)previousTraitCollection.userInterfaceStyle == 1 ? @"Light":@"Dark");
}

- (void)addViews {
    UIImage *image = [UIImage imageNamed:@"Image_adjust"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 130, 100, 100)];
    imgView.image = image;
    [self.view addSubview:imgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 200, 60)];
    label.text = @"这是一个UILabel";
    if (@available(iOS 13.0, *)) {
        label.textColor = [UIColor labelColor];
    } else {
        label.textColor = [UIColor blueColor];
    }
    [self.view addSubview:label];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 370, [UIScreen mainScreen].bounds.size.width, 1)];
    line.backgroundColor = [UIColor yqLineColor];
    [self.view addSubview:line];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 500, 200, 45)];
    [btn setTitle:@"点击查看系统动态颜色" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor yqButtonTextColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor yqbuttonBackgroundColor];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnAction {
    YQSystemColorViewController *systemVC = [[YQSystemColorViewController alloc] init];
    [self.navigationController pushViewController:systemVC animated:YES];
}


@end

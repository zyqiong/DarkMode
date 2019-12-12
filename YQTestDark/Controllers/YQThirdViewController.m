//
//  YQThirdViewController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/3.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQThirdViewController.h"
#import <Masonry/Masonry.h>

#import "YQPresentViewController.h"

@interface YQThirdViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTable;

@property (nonatomic, strong) NSArray *dataSourceArray;

@end

@implementation YQThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yqcolorWithLightColor:[UIColor redColor] darkColor:[UIColor blueColor]];
    
    [self addTable];
}

- (void)clickAction:(NSInteger)index {
    YQPresentViewController *preVC = [[YQPresentViewController alloc] init];
    preVC.modalPresentationStyle = index;
    [self.navigationController presentViewController:preVC animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.dataSourceArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self clickAction:indexPath.row];
}

#pragma mark - Create

- (void)addTable {
    [self.view addSubview:self.mainTable];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
}

- (UITableView *)mainTable {
    if (_mainTable == nil) {
        UITableView *table = [[UITableView alloc] init];
        table.delegate = self;
        table.dataSource = self;
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _mainTable = table;
    }
    return _mainTable;
}

- (NSArray *)dataSourceArray {
    _dataSourceArray = @[
        @"UIModalPresentationFullScreen",
        @"UIModalPresentationPageSheet",
        @"UIModalPresentationFormSheet",
        @"UIModalPresentationCurrentContext",
        @"UIModalPresentationCustom",
        @"UIModalPresentationOverFullScreen",
        @"UIModalPresentationOverCurrentContext",
        @"UIModalPresentationPopover",
        @"UIModalPresentationBlurOverFullScreen"
    ];
    return _dataSourceArray;
}


@end

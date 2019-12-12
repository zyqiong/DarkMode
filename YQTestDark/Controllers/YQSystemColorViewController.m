//
//  YQSystemColorViewController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/8.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQSystemColorViewController.h"

#import <Masonry/Masonry.h>

@interface YQSystemColorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTable;

@property (nonatomic, strong) NSArray *dataSourceArray;
@property (nonatomic, strong) NSArray *colorArray;

@end

@implementation YQSystemColorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yqcolorWithLightColor:[UIColor redColor] darkColor:[UIColor blueColor]];
    
    [self addTable];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colorArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = self.dataSourceArray[indexPath.row];
    cell.backgroundColor = self.colorArray[indexPath.row];
    cell.textLabel.textColor = [UIColor yqMainColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
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
        @"[UIColor systemBackgroundColor]",
        @"[UIColor systemGrayColor]",
        @"[UIColor labelColor]",
        @"[UIColor secondaryLabelColor]",
        @"[UIColor linkColor]",
        @"[UIColor separatorColor]",
        @"[UIColor systemRedColor]",
        @"[UIColor systemBlueColor]",
        @"[UIColor systemFillColor]",
        @"[UIColor systemGroupedBackgroundColor]"
    ];
    return _dataSourceArray;
}

- (NSArray *)colorArray {
    if (@available(iOS 13.0, *)) {
        _colorArray = @[
            [UIColor systemBackgroundColor],
            [UIColor systemGrayColor],
            [UIColor labelColor],
            [UIColor secondaryLabelColor],
            [UIColor linkColor],
            [UIColor separatorColor],
            [UIColor systemRedColor],
            [UIColor systemBlueColor],
            [UIColor systemFillColor],
            [UIColor systemGroupedBackgroundColor]
        ];
    } else {
        _colorArray = @[];
    }
    return _colorArray;
}
@end

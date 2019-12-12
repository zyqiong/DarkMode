//
//  YQSecondViewController.m
//  YQTestDark
//
//  Created by zyqiong on 2019/12/3.
//  Copyright © 2019 zyqiong. All rights reserved.
//

#import "YQSecondViewController.h"

#import "YQMenuController.h"

@interface YQSecondViewController ()<
     UITableViewDelegate,
     UITableViewDataSource,
     UIContextMenuInteractionDelegate>

@property (nonatomic, strong) UITableView *mainTable;

@end

@implementation YQSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:self.mainTable];
    
    [self addMenu];
    
}

- (void)addMenu {
    if (@available(iOS 13.0, *)) {
        UIContextMenuInteraction *interaction = [[UIContextMenuInteraction alloc] initWithDelegate:self];
       
        [self.view addInteraction:interaction];
    }
}

#pragma mark - UIContextMenuInteractionDelegate

- (UIContextMenuConfiguration *)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location  API_AVAILABLE(ios(13.0)){
    if (@available(iOS 13.0, *)) {
        UIContextMenuConfiguration *configuration = [UIContextMenuConfiguration configurationWithIdentifier:nil previewProvider:^UIViewController * _Nullable{
            YQMenuController *menuVC = [[YQMenuController alloc] init];
            return menuVC;
        } actionProvider:^UIMenu * _Nullable(NSArray<UIMenuElement *> * _Nonnull suggestedActions) {
            UIAction *action = [UIAction actionWithTitle:@"action000" image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
                NSLog(@"点击了action00");
            }];
            UIAction *action1 = [UIAction actionWithTitle:@"action111" image:nil identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
                NSLog(@"点击了action111");
            }];
            UIMenu *menu = [UIMenu menuWithTitle:@"menu name" children:@[action,action1]];
            return menu;
        }];
        return configuration;
    } else {
        return nil;
    }
}



#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

#pragma mark - add views

- (UITableView *)mainTable {
    if (_mainTable == nil) {
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
        table.delegate = self;
        table.dataSource = self;
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _mainTable = table;
    }
    return _mainTable;
}

@end

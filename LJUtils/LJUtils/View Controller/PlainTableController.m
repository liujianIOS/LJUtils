//
//  PlainTableController.m
//  LJUtils
//
//  Created by liujian on 2018/6/25.
//  Copyright © 2018年 liujian. All rights reserved.
//

#import "PlainTableController.h"


static NSString * const kPlainCellIdentifier = @"kPlainCellIdentifier";

@interface PlainTableController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView * tableView;
@end

@implementation PlainTableController

#pragma mark - Circle Life
-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource and UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kPlainCellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld",indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Setter and Getter
-(UITableView *)tableView{
    if (_tableView == nil) {
        CGFloat startY = self.navigationController.navigationBar.frame.size.height;
        UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, startY, SCREEN_WIDTH, SCREEN_HEIGHT - startY) style:UITableViewStylePlain];
        table.delegate = self;
        table.dataSource = self;
        
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:kPlainCellIdentifier];
        
        table.rowHeight = 50;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.tableFooterView = [[UIView alloc] init];
        table.showsVerticalScrollIndicator = NO;
        table.showsHorizontalScrollIndicator = NO;
        _tableView = table;
    }
    return _tableView;
}



@end

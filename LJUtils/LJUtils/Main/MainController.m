//
//  MainController.m
//  LJUtils
//
//  Created by liujian on 2018/5/29.
//  Copyright © 2018年 liujian. All rights reserved.
//

#import "MainController.h"
#import "MainTableViewCell.h"

@interface MainController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView * table;
@property(nonatomic, strong) NSArray * listArr;
@end

static NSString * const kMainCellIdentifier = @"MainCellIdentifier";

@implementation MainController

#pragma mark - Circle Life
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.table];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
    NSInteger idx = indexPath.row;
    cell.textLabel.text = self.listArr[idx];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Setter and Getter
-(UITableView *)table{
    if (_table == nil) {
        CGFloat barHeight = self.navigationController.navigationBar.frame.size.height;
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, barHeight, SCREEN_WIDTH, SCREEN_HEIGHT - barHeight) style:UITableViewStylePlain];
        [tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:kMainCellIdentifier];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 50.0f;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table = tableView;
    }
    return _table;
}

-(NSArray *)listArr{
    if (_listArr == nil) {
        NSArray * titleItems = @[@"TableView"];
        _listArr = titleItems;
    }
    return _listArr;
}

@end

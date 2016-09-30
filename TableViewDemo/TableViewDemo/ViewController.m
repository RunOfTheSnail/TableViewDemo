//
//  ViewController.m
//  MyTableviewDemo002
//
//  Created by zhangyan on 16/9/30.
//  Copyright © 2016年 zhangyan. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.myTableView];
    
}

- (UITableView *)myTableView
{
    if (!_myTableView) {
        UITableView * myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        
        myTableView.tableFooterView = [UIView new];
        myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [myTableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
        
        _myTableView = myTableView;
    }
    return _myTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    if(indexPath.row%2){
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  CollectionViewAutoLayOutDemo
//
//  Created by 彭昭君 on 16/12/19.
//  Copyright © 2016年 pzj. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

/** 屏幕宽高 */
#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ViewController

#pragma mark - lifeCycle                    - Method -
- (void)dealloc
{
    NSLog(@"VC -> dealloc");
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
//    self.navigationController.title = @"collection Layout";
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    title.text = @"home";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor grayColor];
    title.font = [UIFont systemFontOfSize:16];
    self.navigationItem.titleView = title;

    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - eventResponse                - Method -

#pragma mark - notification                 - Method -

#pragma mark - privateMethods               - Method -

#pragma mark - customDelegate               - Method -

#pragma mark - objective-cDelegate          - Method -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (self.dataArray.count>0) {
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.dataArray.count>0) {
        NSString *str = self.dataArray[indexPath.row];
        MainViewController *vc = [[MainViewController alloc] init];
        vc.comeFrom = str;
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark - getters and setters          - Method -
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"图文",@"文字",@"image", nil];
    }
    return _dataArray;
}
@end

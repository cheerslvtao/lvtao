//
//  ShenHeViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/15.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "ShenHeViewController.h"
#import "ShenHeCell.h"
#import "ShenHeDetailViewController.h"
@interface ShenHeViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) NSArray * dataArr;

@end

@implementation ShenHeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate =self;

    self.view.backgroundColor = [UIColor LowWhileColor];
    
    [self.view addSubview:self.tableView];

    [self addRightItem];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"审核" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark == 初始化数组
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen-64) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"ShenHeCell" bundle:nil] forCellReuseIdentifier:@"ShenHeCell"];
    }
    return _tableView;
}

#pragma mark == 初始化数组
-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSArray alloc]initWithObjects:@{@"content":@"希望您的手机能够保持联网状态，这样可以及时的给你发送订单信息",@"other":@"待反馈后再看",@"status":@"待审核"},@{@"content":@"希望您的手机能够保持联网状态，这样可以及时的给你发送订单信息",@"other":@"待反馈后再看",@"status":@"已审核"}, @{@"content":@"希望您的手机能够保持联网状态，这样可以及时的给你发送订单信息",@"other":@"待反馈后再看",@"status":@"待审核"},  nil];
    }
    return _dataArr;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString * content = [self.dataArr[indexPath.row] objectForKey:@"content"];
    NSString * status = [self.dataArr[indexPath.row] objectForKey:@"status"];
    NSString * other = [self.dataArr[indexPath.row] objectForKey:@"other"];
    
    ShenHeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ShenHeCell" forIndexPath:indexPath];
    cell.content.text = content;
    cell.status.text = status;
    if ([status isEqualToString:@"待审核"]) {
        cell.status.textColor = [UIColor redColor];
    }
    cell.other.text = other;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShenHeDetailViewController * vc = [ShenHeDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}






@end

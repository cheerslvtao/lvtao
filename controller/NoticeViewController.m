//
//  NoticeViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "NoticeViewController.h"
#import "NoticeCell.h"

@interface NoticeViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView * noticeTableView;

@property (nonatomic,strong) NSMutableArray * dataArr;

@property (nonatomic,strong) NSMutableArray * timeArr;

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate =self;

    [self addRightItem];
    [self.view addSubview:self.noticeTableView];
}

#pragma mark == 初始化数组
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]initWithObjects:@"啊回复哈佛  法司法胡搜费还是",@"ISO返回搜房搜房is地方还是佛山法搜方法会死哦发货斯蒂芬是否是覅偶师傅is防洪堤沙发上防护四好",@"发顺丰回复数好佛山",@"和佛山和佛山粉丝发后是否iOS覅；按平方；哦覅； 返回", nil];
    }
    return _dataArr;
}

-(NSMutableArray *)timeArr{
    if (!_timeArr) {
        _timeArr = [[NSMutableArray alloc]initWithObjects:@"2016-2-4 8:44",@"2016-2-4 8:44",@"2016-2-4 8:44",@"2016-2-4 8:44", nil];
    }
    return _timeArr;
}

#pragma mark == 左边 右边 
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"系统公告" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark == tableView初始化
-(UITableView *)noticeTableView{
    if (!_noticeTableView) {
        _noticeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen-64) style:UITableViewStylePlain];
        _noticeTableView.delegate=self;
        _noticeTableView.dataSource = self;
        _noticeTableView.estimatedRowHeight = 80;
        _noticeTableView.rowHeight = UITableViewAutomaticDimension;
        [_noticeTableView registerNib:[UINib nibWithNibName:@"NoticeCell" bundle:nil] forCellReuseIdentifier:@"notice"];
    }
    return _noticeTableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NoticeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"notice"];
    cell.time.text = self.timeArr[indexPath.row];
    cell.title.text = self.dataArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}







@end

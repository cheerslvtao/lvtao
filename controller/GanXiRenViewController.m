//
//  GanXiRenViewController.m
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "GanXiRenViewController.h"

@interface GanXiRenViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView * personTableView;
@property (nonatomic,strong) NSArray * dataArr;

@end

@implementation GanXiRenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self addRightItem];
    [self.view addSubview:self.personTableView];
}
#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"干系人" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark == 初始化tableView
-(UITableView *)personTableView{
    if (!_personTableView ) {
        _personTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, width_screen, height_screen-84) style:UITableViewStylePlain];
        _personTableView.delegate = self;
        _personTableView.dataSource = self;
        _personTableView.bounces =NO;
    }
    return _personTableView;
}

#pragma mark ==数组
-(NSArray * )dataArr{

    if (!_dataArr){
        _dataArr = [[NSArray alloc]initWithObjects:@"服务顾问：张三",@"项目经理：李四",@"甲方负责人：王五",@"项目成员：李青",@"产品经理：艾希",@"直属领导：诺克萨斯", nil];
    }
    return _dataArr;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * str = @"ganxiren";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    NSString * string = self.dataArr[indexPath.row];
    NSRange range = [string rangeOfString:@"："];
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:string];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(range.location+1, string.length -range.location -1 )];
    cell.textLabel.attributedText =attStr;
    return cell;
}

@end

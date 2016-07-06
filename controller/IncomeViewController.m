//
//  IncomeViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/14.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "IncomeViewController.h"
#import "IncomeCell.h"
@interface IncomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * incomeTV ;

@property (nonatomic,strong) NSMutableArray * dataArr ;


@end

@implementation IncomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor LowWhileColor];
    [self createTopView];
    [self.view addSubview:self.incomeTV];
}

-(void)createTopView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 10, width_screen, 80)];
    view.backgroundColor = [UIColor whiteColor];
    
    NSArray * labelArr = @[@"本月收入：8888元",@"可提现金额：6666元"];
    NSArray * buttonArr =@[@"说明",@"提现"];
    
    for (int i=0; i<2; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+30*i,  width_screen/2, 30)];
        label.text = labelArr[i];
        label.font = [UIFont systemFontOfSize:15];
        [view addSubview:label];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake( width_screen - 10 - (i+1)*(width_screen/6+5),25, width_screen/6,30);
        [btn setTitle:buttonArr[i] forState:UIControlStateNormal];
        btn.backgroundColor =[UIColor orangeColor];
        btn.layer.cornerRadius = 5;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.tag = i+300;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
    }
    [self.view addSubview:view];
}

-(void)clickBtn:(UIButton *)btn{
    if (btn.tag == 300) {
        NSLog(@"提现");
    }else if(btn.tag == 301){
        NSLog(@"说明");
    }
}

#pragma mark == 初始化tableView
-(UITableView *)incomeTV{
    if (!_incomeTV) {
        _incomeTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, width_screen, height_screen-100-64-48)
                                                    style:UITableViewStylePlain];
        _incomeTV.backgroundColor = [UIColor LowWhileColor];
        _incomeTV.delegate = self;
        _incomeTV.dataSource = self;
        _incomeTV.showsVerticalScrollIndicator= NO;
        [_incomeTV registerNib:[UINib nibWithNibName:@"IncomeCell" bundle:nil] forCellReuseIdentifier:@"incomeCell"];
    }
    return _incomeTV;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
//每个区的单元数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IncomeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"incomeCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width_screen, 35)];
    view.backgroundColor = [UIColor LowWhileColor];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 35)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"订单信息";
    [view addSubview:label];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(width_screen*246/390, 0, width_screen*45/390, 35)];
    label1.font = [UIFont systemFontOfSize:14];
    label1.text = @"状态";
    [view addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(width_screen*317/390, 0, width_screen*65/390, 35)];
    label2.font = [UIFont systemFontOfSize:14];
    label2.text = @"积分";
    [view addSubview:label2];
   
    return view;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

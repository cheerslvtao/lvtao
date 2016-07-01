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
    
    [self createTopView];
    [self.view addSubview:self.incomeTV];
}

-(void)createTopView{
    
    NSArray * labelArr = @[@"本月收入：8888元",@"可提现金额：6666元"];
    NSArray * buttonArr =@[@"提现",@"说明"];
    for (int i=0; i<2; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, (width_screen/9)*(i+1),  width_screen, width_screen/9)];
        label.text = labelArr[i];
        
        label.textAlignment = NSTextAlignmentCenter ;
        [self.view addSubview:label];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width_screen/9+ i*((width_screen)/3+width_screen/9) , width_screen/3+30, width_screen/3, width_screen/9);
        [btn setTitle:buttonArr[i] forState:UIControlStateNormal];
        btn.backgroundColor =[UIColor redColor];
        btn.layer.cornerRadius = width_screen/18;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i+300;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)clickBtn:(UIButton *)btn{
    if (btn.tag == 300) {
        NSLog(@"提现");
    }else{
        NSLog(@"说明");
    }
}

#pragma mark == 初始化tableView
-(UITableView *)incomeTV{
    if (!_incomeTV) {
        _incomeTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 5+width_screen/3+30+width_screen/9, width_screen, height_screen-48-(64+width_screen/3+30+width_screen/9))
                                                    style:UITableViewStylePlain];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  QiangdanViewController.m
//  金服
//
//  Created by 王旭阳 on 16/6/14.
//  Copyright © 2016年 王旭阳. All rights reserved.
//

#import "QiangdanViewController.h"
#import "Masonry.h"
@interface QiangdanViewController ()

@end

@implementation QiangdanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1];

    UIImageView*wifiView=[[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/10, 30, 74, 64)];
    wifiView.image=[UIImage imageNamed:@"xinhao_3"];
    [self.view addSubview:wifiView];
    UILabel*lab=[[UILabel alloc]initWithFrame:CGRectMake(wifiView.bounds.size.width+70, 30, 200, 64)];
    lab.text=@"与服务连接良好";
    lab.textColor=[UIColor lightGrayColor];
    lab.font=[UIFont systemFontOfSize:20];
    [self.view addSubview:lab];
    
     _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 180-64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-48-180)];
    _tabView.delegate=self;
    _tabView.dataSource=self;
    _tabView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    _tabView.backgroundColor=[UIColor colorWithRed:242.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1];
    [self.view addSubview:_tabView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray*xiangmuArr=@[@"标枪制作",@"Javc优化",@"软件项目监理",@"公司统筹策划",@"石家庄天气问题"];
    NSArray*dateArr=@[@"今天 6:00 石家庄",@"今天 8:00 北京",@"昨天 9:00 美国",@"今天 6:00 石家庄",@"前天 6:00 石家庄"];
    cell.textLabel.font=[UIFont systemFontOfSize:17];
    cell.textLabel.text=xiangmuArr[indexPath.row];
    UILabel*dateLab=[[UILabel alloc]init];
    dateLab.text=dateArr[indexPath.row];
    dateLab.textColor=[UIColor grayColor];
    dateLab.font=[UIFont systemFontOfSize:12];
    [cell.contentView addSubview:dateLab];
   
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor colorWithRed:29.0/255.0 green:166.0/255.0 blue:215.0/255.0 alpha:1];
    btn.layer.cornerRadius=5;
    [btn setTitle:@"抢" forState:UIControlStateNormal];
    [cell.contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell.contentView);
        make.right.equalTo(cell.contentView.mas_right).offset(-10);
        make.size.mas_equalTo((CGSize){50,50});
//        make.right.equalTo(dateLab).offset(-5);
    }];
    [dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell.contentView);
        make.right.equalTo(btn.mas_left).offset(-11);
    }];
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;

}

@end

//
//  GouTongJiLuViewController.m
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "GouTongJiLuViewController.h"
#import "CreateNewMessageViewController.h"
@interface GouTongJiLuViewController ()

@end

@implementation GouTongJiLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=@[@"2012-3-5",@"2012-3-6",@"2012-3-7"];
    _infoArr=@[@"讨论服务器的生计问题对方是否地方发顺丰沙发斯蒂芬啥地方萨芬都是法师反倒是防守打法大法师的方法",@"探讨app的设计问题",@"探讨app服务人群的百分比"];
    self.automaticallyAdjustsScrollViewInsets=NO;

    self.view.backgroundColor=[UIColor LowWhileColor];
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-84)];
    _tabView.dataSource=self;
    _tabView.delegate=self;
    _tabView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);

    [self.view addSubview:_tabView];
    [self addRightItem];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"沟通记录" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
    
    //右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 35);
    [btn setTitle:@"新建" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 0.4;
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btn addTarget:self action:@selector(editing) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)editing{
    CreateNewMessageViewController * new = [CreateNewMessageViewController new];
    new.backTitle = @"新建沟通记录";
    [self.navigationController pushViewController:new animated:YES];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

#pragma mark == tableView delegate
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle=UITableViewCellAccessoryNone;

    UILabel*dateLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, [UIScreen mainScreen].bounds.size.width-30, 40)];
    dateLab.text=_dataArr[indexPath.row];
    dateLab.textColor=[UIColor grayColor];
    dateLab.font=[UIFont systemFontOfSize:13];
    [cell addSubview:dateLab];
    UILabel*infoLab=[[UILabel alloc]initWithFrame:CGRectMake(20, 40,[UIScreen mainScreen].bounds.size.width-30, 40)];
    infoLab.numberOfLines = 0;
    infoLab.adjustsFontSizeToFitWidth = YES;
    infoLab.text=_infoArr[indexPath.row];
    
    [cell addSubview:infoLab];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}




@end

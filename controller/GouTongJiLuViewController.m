//
//  GouTongJiLuViewController.m
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "GouTongJiLuViewController.h"

@interface GouTongJiLuViewController ()

@end

@implementation GouTongJiLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=@[@"2012-3-5",@"2012-3-6",@"2012-3-7"];
    _infoArr=@[@"讨论服务器的生计问题",@"探讨app的设计问题",@"探讨app服务人群的百分比"];
    self.automaticallyAdjustsScrollViewInsets=NO;

    self.view.backgroundColor=[UIColor whiteColor];
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-84)];
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
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
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
    infoLab.text=_infoArr[indexPath.row];
    
    [cell addSubview:infoLab];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

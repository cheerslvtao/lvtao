//
//  XiangQingViewController.m
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/24.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "XiangQingViewController.h"
#import "KeHuXinXiViewController.h"
#import "FuWuQingDanViewController.h"
#import "GouTongJiLuViewController.h"
#import "ShiShiFangAnViewController.h"
#import "ShiShiWenDangViewController.h"
#import "GanXiRenViewController.h"
@interface XiangQingViewController ()<UIGestureRecognizerDelegate>

@end

@implementation XiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate =self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor=[UIColor LowWhileColor];
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44*6)];
    _tabView.delegate=self;
    _tabView.dataSource=self;
    _tabView.scrollEnabled = NO;
    [_tabView setSeparatorColor:[UIColor  lightGrayColor]];
    _tabView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    [self.view addSubview:_tabView];
    [self addRightItem];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"服务单详情" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma 代理方法tabview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 6;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    NSArray*imgArr=@[@"fwd_dhxx",@"fwd_fwqd",@"fwd_gtjl",@"fwd_ssfa",@"fwd_sswd",@"fwd_gxr"];
    NSArray*titleArr=@[@"客户信息",@"服务清单",@"沟通记录",@"实施方案",@"实施文档",@"干系人"];
    cell.imageView.image =[UIImage imageNamed:imgArr[indexPath.row]];
    cell.selectionStyle=UITableViewCellAccessoryNone;
    cell.textLabel.text=titleArr[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        KeHuXinXiViewController*vc=[KeHuXinXiViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }if (indexPath.row==1) {
        FuWuQingDanViewController*vc=[FuWuQingDanViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }if (indexPath.row==2) {
        GouTongJiLuViewController*vc=[GouTongJiLuViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }if (indexPath.row==3) {
        ShiShiFangAnViewController *vc=[ShiShiFangAnViewController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }if (indexPath.row==4) {
        ShiShiWenDangViewController*vc=[ShiShiWenDangViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }if (indexPath.row==5)
    {
        
        GanXiRenViewController*vc=[GanXiRenViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
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

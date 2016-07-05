//
//  ShenHeDetailViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/7/5.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "ShenHeDetailViewController.h"
#import "KeHuXinXiViewController.h"
#import "FuWuQingDanViewController.h"
#import "GouTongJiLuViewController.h"
#import "ShiShiFangAnViewController.h"
#import "ShiShiWenDangViewController.h"
@interface ShenHeDetailViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) UITextView * textView;

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ShenHeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor LowWhileColor];
    
    [self addRightItem];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.tableView];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"工作审核" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark === textView
-(UITextView *)textView{
    
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 40, width_screen-20,120)];
        _textView.textColor = [UIColor grayColor];
        _textView.text = @"审核工作内容审核工作内容审核工作内容审核工作内容审核工作内容审核工作内容审核工作内容";
        _textView.font = [UIFont systemFontOfSize:16];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, width_screen-20, 40)];
        label.text = @"待审核工作";
        [self.view addSubview:label];
        NSArray*btnArr=@[@"同意",@"修改",@"批注"];
        for (int i=0; i<3; i++) {
            UIButton * btn = [UIKitFactory UIButtonWithFrame:CGRectMake(10+i*((width_screen-50)/3+15), 170, (width_screen-50)/3, 30) Title:btnArr[i] action:@selector(clickButton:) taget:self];
            btn.backgroundColor=[UIColor LowBlueColor];
            btn.alpha=0.7;
            btn.layer.cornerRadius=5;
            [self.view addSubview:btn];
        }
    }
    return _textView;
}

-(void)clickButton:(UIButton *)btn{
    
}
#pragma mark == 初始化tableView
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 210, [UIScreen mainScreen].bounds.size.width,height_screen-210-64)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.estimatedRowHeight = 45;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
    }

    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    NSArray*imgArr=@[@"fwd_dhxx",@"fwd_fwqd",@"fwd_gtjl",@"fwd_ssfa",@"fwd_sswd"];
    NSArray*titleArr=@[@"客户信息",@"服务清单",@"沟通记录",@"实施方案",@"实施文档"];
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
    }
}

-(void)ss
{
    NSArray*btnArr=@[@"同意",@"修改",@"批注"];
    for (int i=0; i<3; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake((self.view.bounds.size.width/3+10)*i+10, self.view.bounds.size.height/3, self.view.bounds.size.width/4, 45);
        [btn setTitle:btnArr[i] forState:UIControlStateNormal];
        btn.backgroundColor=[UIColor blueColor];
        btn.alpha=0.7;
        btn.layer.cornerRadius=10;
        [self.view addSubview:btn];
    }
    
    NSArray*titleArr=@[@"客户信息",@"服务清单",@"沟通记录",@"实施方案",@"实施文档",@"干系人"];
    for (int i=0; i<6;i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(10, 49*i+self.view.bounds.size.height/2, self.view.bounds.size.width-20, 44) ;
        btn.backgroundColor=[UIColor grayColor];
        btn.alpha=.6;
        btn.tag=i;
        [btn setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end

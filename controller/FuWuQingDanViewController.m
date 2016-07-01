//
//  FuWuQingDanViewController.m
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/24.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "FuWuQingDanViewController.h"

@interface FuWuQingDanViewController ()
{
    CGFloat labHight;
}
@end

@implementation FuWuQingDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 74, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _tabView.delegate=self;
    _tabView.dataSource=self;
    _tabView.scrollEnabled = NO;
    _tabView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);

    _tabView.backgroundColor=[UIColor colorWithRed:242.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1];
    [self.view addSubview:_tabView];
    [self addRightItem];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"服务清单" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row==0) {
        NSString*str=@"服务名称:石家庄稻田网络公司";
        NSMutableAttributedString*attStr=[[NSMutableAttributedString alloc]initWithString:str];
        NSLog(@"----->>>>%@",attStr);
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(5,str.length-5)];
        
        [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(5,str.length-5)];
        cell.textLabel.attributedText=attStr;

    }
        if (indexPath.row==1) {
        UILabel*lab=[[UILabel alloc]initWithFrame:CGRectMake(20,0 , [UIScreen mainScreen].bounds.size.width-30, 200)];
        lab.numberOfLines=0;
        NSString*str=@"服务事项:\n1.希望你的手机能够保持联网状态，这样我们可以顺利给你发送信息。\n2.希望您打开GPS服务，这样可以最快给你发送最近的。\n3.如果有任何问题可以通过\"我\"->\"设置\"->\"平台联系方式\"所列的联系方式联系我们。";
        NSRange range = [str rangeOfString:@":"];
        
        NSMutableAttributedString*attStr=[[NSMutableAttributedString alloc]initWithString:str];
        
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(range.location+1,attStr.length-range.location-1)];

            lab.attributedText=attStr;
            [cell addSubview:lab];
    }
    return cell;
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 44;
    }if (indexPath.row==1) {
        return 200;
    }
    return 0;
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

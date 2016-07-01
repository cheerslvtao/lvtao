//
//  ContactViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "ContactViewController.h"
#import "EditingInfoViewController.h"
@interface ContactViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * userBaseTable;

@property (nonatomic,strong) NSMutableArray * dataArr;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataArr = [[NSMutableArray alloc]initWithObjects:@"手机：12344566777",@"Q Q：735835975",@"微信：12344566777",@"邮箱：12344566777qq.com", nil];
    [self addRightItem];
    [self.view addSubview:self.userBaseTable];
    
}
#pragma mark == 左边 右边 编辑按钮
-(void)addRightItem{
    //右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 35);
    [btn setTitle:@"编辑" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 0.4;
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btn addTarget:self action:@selector(editing) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"联系方式" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];

}

-(void)editing{
    EditingInfoViewController * vc = [EditingInfoViewController new];
    vc.dataArr = self.dataArr;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITableView *)userBaseTable{
    if (!_userBaseTable) {
        _userBaseTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen-64) style:UITableViewStylePlain];
        _userBaseTable.showsVerticalScrollIndicator = NO;
        _userBaseTable.delegate =self;
        _userBaseTable.dataSource =self;
        _userBaseTable.bounces = NO;
    }
    return _userBaseTable;
}

#pragma mark == table代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * userBase = @"userBase";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:userBase];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userBase];
    }
    
    //添加副文本
    NSRange range = [self.dataArr[indexPath.row] rangeOfString:@"："];
    NSLog(@"=======%@",NSStringFromRange(range));
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self.dataArr[indexPath.row]];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(range.location+1,[self.dataArr[indexPath.row] length]-range.location-1 )];
    
    
    cell.textLabel.attributedText =attStr;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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

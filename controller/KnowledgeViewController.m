//
//  KnowledgeViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/15.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "KnowledgeViewController.h"
#import "KnowledgeCell.h"
#import "DetailViewController.h"
@interface KnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UITableView * knowledgeTV;

@property (nonatomic,strong) NSMutableArray * dataArr ;


@end

@implementation KnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate =self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.knowledgeTV];
    [self addRightItem];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"知识库" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITableView *)knowledgeTV{
    if (!_knowledgeTV) {
        _knowledgeTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen) style:UITableViewStylePlain];
        _knowledgeTV.delegate = self;
        _knowledgeTV.dataSource =self;
        _knowledgeTV.estimatedRowHeight = 60;
        _knowledgeTV.rowHeight = UITableViewAutomaticDimension;
        
        [_knowledgeTV registerNib:[UINib nibWithNibName:@"KnowledgeCell" bundle:nil] forCellReuseIdentifier:@"KnowledgeCell"];
        _knowledgeTV.showsVerticalScrollIndicator = NO;
    }
    return _knowledgeTV;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KnowledgeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"KnowledgeCell" forIndexPath:indexPath];
    cell.title.text = [NSString stringWithFormat:@"标题：稻田金服 %ld 号",(long)indexPath.row];
    cell.name.text = @"光之翼";
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController * vc = [DetailViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end

//
//  KnowledgeViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/15.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "KnowledgeViewController.h"

@interface KnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * knowledgeTV;

@property (nonatomic,strong) NSMutableArray * dataArr ;


@end

@implementation KnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"知识库";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.knowledgeTV];
    
}


-(UITableView *)knowledgeTV{
    if (!_knowledgeTV) {
        _knowledgeTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen) style:UITableViewStylePlain];
        _knowledgeTV.delegate = self;
        _knowledgeTV.dataSource =self;
        
        _knowledgeTV.showsVerticalScrollIndicator = NO;
    }
    return _knowledgeTV;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10 ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * knowledgeId = @"knowledge";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:knowledgeId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:knowledgeId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"标题：稻田金服 %ld 号",(long)indexPath.row];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"作者：光之翼老 %ld ",indexPath.row];
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

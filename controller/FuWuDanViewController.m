//
//  FuWuDanViewController.m
//  金服
//
//  Created by 王旭阳 on 16/6/15.
//  Copyright © 2016年 王旭阳. All rights reserved.
//

#import "FuWuDanViewController.h"
#import "XiangQingViewController.h"
#import "Masonry.h"
@interface FuWuDanViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSMutableArray *selectStuats;
@property(nonatomic,retain)UIButton*weiWanChengBtn;
@property(nonatomic,retain)UIButton*yiWanChengBtn;
@property(nonatomic,retain)UIView*infoView;
@property(nonatomic,retain)UIScrollView*scroll;
@property (nonatomic,strong) UIView * animatView;

@end

@implementation FuWuDanViewController
-(void)viewDidAppear:(BOOL)animated{
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title.accessibilityElementsHidden = YES;
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [self addSelectBUtton]; //按钮
    
    [self.view addSubview:self.animatView]; //动画条
    [self scrollView]; //添加scrollView
    
    [self yiwanchengView];
    [self weiwanchengView];

}

#pragma mark == 添加视图切换按钮
-(void)addSelectBUtton{
    //未完成按钮
    _weiWanChengBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _weiWanChengBtn.frame=CGRectMake(0, 0, self.view.bounds.size.width/2, 43);
    [_weiWanChengBtn setTitle:@"未完成订单" forState:UIControlStateNormal];
    [_weiWanChengBtn setTitleColor:[UIColor LowBlueColor] forState:UIControlStateSelected];
    [_weiWanChengBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _weiWanChengBtn.selected = YES;
    _weiWanChengBtn.backgroundColor = [UIColor LowWhileColor];
    [_weiWanChengBtn addTarget:self action:@selector(weiwancheng) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_weiWanChengBtn];
    
    //已完成按钮
    _yiWanChengBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _yiWanChengBtn.frame=CGRectMake(self.view.bounds.size.width/2,0, self.view.bounds.size.width/2, 43);
    _yiWanChengBtn.backgroundColor=[UIColor LowWhileColor];
    [_yiWanChengBtn setTitleColor:[UIColor LowBlueColor] forState:UIControlStateSelected];
    [_yiWanChengBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _yiWanChengBtn.selected = NO;
    [_yiWanChengBtn setTitle:@"已完成订单" forState:UIControlStateNormal];
    [_yiWanChengBtn addTarget:self action:@selector(yiwancheng) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_yiWanChengBtn];

}

-(void)weiwancheng
{

    if (!_weiWanChengBtn.selected ){
        [UIView animateWithDuration:0.05 animations:^{
            _weiWanChengBtn.selected = YES;
            _yiWanChengBtn.selected =NO;
            _animatView.frame = CGRectMake(0, 43, width_screen/2, 2);
        }];
    }
    [_scroll setContentOffset:CGPointMake(0, 0) animated:YES];
    
}
-(void)yiwancheng
{

    if (!_yiWanChengBtn.selected ){
        [UIView animateWithDuration:0.05 animations:^{
            _weiWanChengBtn.selected = NO;
            _yiWanChengBtn.selected =YES;
            _animatView.frame = CGRectMake(width_screen/2, 43, width_screen/2, 2);
        }];
    }

    [_scroll setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:YES];
    
}


#pragma mark == 动画视图
-(UIView *)animatView{
    if (!_animatView) {
        _animatView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, width_screen/2, 2)];
        _animatView.backgroundColor = [UIColor LowBlueColor];
    }
    return _animatView;
}

#pragma mark == 添加scroll
-(void)scrollView
{
    _scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 45, self.view.bounds.size.width, height_screen-(45+48))];
    _scroll.contentSize=CGSizeMake(self.view.bounds.size.width*2,  height_screen-(45+64+48));
    _scroll.showsVerticalScrollIndicator=NO;
    _scroll.showsHorizontalScrollIndicator=NO;
    _scroll.delegate=self;
    _scroll.bounces=NO;
    _scroll.pagingEnabled=YES;
    [self.view addSubview:_scroll];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contensizx=_scroll.contentOffset.x;
    if (contensizx==self.view.bounds.size.width) {
        _weiWanChengBtn.selected = NO;
        _yiWanChengBtn.selected =YES;

        [UIView animateWithDuration:0.05 animations:^{
            _animatView.frame = CGRectMake(width_screen/2, 43, width_screen/2, 2);
        }];
    }else if (contensizx==0){
        [UIView animateWithDuration:0.05 animations:^{
            _weiWanChengBtn.selected = YES;
            _yiWanChengBtn.selected =NO;
            _animatView.frame = CGRectMake(0, 43, width_screen/2, 2);
        }];
    }
}

#pragma mark == 未完成view
-(void)weiwanchengView
{
   
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64-45-48)];
    _tabView.tag=10000;
    _tabView.delegate=self;
    _tabView.dataSource=self;
    [_scroll addSubview:_tabView];
   
    
}
#pragma mark == 已完成view
-(void)yiwanchengView
{
    _wanchengtabView=[[UITableView alloc]initWithFrame:CGRectMake(width_screen, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-45-48)];
   
    _wanchengtabView.tag=10001;
    _wanchengtabView.delegate=self;
    _wanchengtabView.dataSource=self;
    [_scroll addSubview:_wanchengtabView];
    
}



#pragma mark == tabview deleget
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag==10000) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"weiwancheng"];
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"weiwancheng"];
            NSArray * arr = @[@"发单时间:   2016-5-5",@"实施地点:   美国福罗里达州",@"公司名称:   百度公司",@"约定时间:   2019-8-8",@"订单号码:   7878878",@"联系电话:   23434343"];
            
            for (int i=0; i<arr.count; i++) {
                
                UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+i*20, width_screen-20, 20)];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor grayColor];
                //添加副文本
                NSRange range = [arr[i] rangeOfString:@":"];
                NSLog(@"=======%@",NSStringFromRange(range));
                NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:arr[i]];
                
                [attStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(range.location+1,[arr[i] length]-range.location-1 )];
                label.attributedText = attStr;
                [cell addSubview:label];
            }

        }
        cell.selectionStyle=UITableViewCellAccessoryNone;
        

        
        return cell;
    }
    
    if (tableView.tag==10001) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"yiwancheng"];
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"yiwancheng"];
            NSArray * arr=@[@"发单时间:   2016-5-5",@"实施地点:   中国广州",@"公司名称:   百度公司",@"约定时间:   2019-8-8",@"订单号码:   7878878",@"联系电话:   23434343"];
            for (int i=0; i<arr.count; i++) {
                
                UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+i*20, width_screen-20, 20)];
                label.font = [UIFont systemFontOfSize:13];
                label.textColor = [UIColor grayColor];
                //添加副文本
                NSRange range = [arr[i] rangeOfString:@":"];
                NSLog(@"=======%@",NSStringFromRange(range));
                NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:arr[i]];
                
                [attStr addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} range:NSMakeRange(range.location+1,[arr[i] length]-range.location-1 )];
                label.attributedText = attStr;
                [cell addSubview:label];
            }

        }
        cell.selectionStyle=UITableViewCellAccessoryNone;
        
        return cell;

    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiangQingViewController*vc=[XiangQingViewController new];
    vc.hidesBottomBarWhenPushed =YES;
    [self.navigationController pushViewController:vc animated:YES];
}




@end

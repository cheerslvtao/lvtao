//
//  RootTabBarViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/14.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "KnowledgeViewController.h"
#import "ShenHeViewController.h"
@interface RootTabBarViewController ()
{
    NSInteger _flag;
    
    UIButton * _RightBtn;
    UIImageView * _menuV;
}

@property (nonatomic,copy) void (^block)(UIButton * btn);

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViewSubController];
}

-(void)addViewSubController{
    
    NSArray * controllerArr = @[@"FuWuDanViewController",@"QiangdanViewController",@"IncomeViewController",@"MineViewController"];
    NSArray * titleArr = @[@"服务单",@"抢单",@"收入",@"我的"];
    NSArray * imageArr = @[@"menu_fwd",@"menu_qd",@"menu_sr",@"menu_wo"];
    NSArray * selectImageArr = @[@"menu_fwd_d",@"menu_qd_d",@"menu_sr_d",@"menu_wo_d"];
    NSArray * headImageArr = @[@"head_icon_fwd",@"head_icon_qd",@"menu_sr",@"head_icon_user"];
    
    NSMutableArray * nvArr = [[NSMutableArray alloc]init];
    
    [controllerArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class cl = NSClassFromString(obj);
        UIViewController * viewController = [[cl alloc]init];
        UINavigationController * navigation = [[UINavigationController alloc]initWithRootViewController:viewController];

        navigation.navigationBar.alpha = 1;
        UIImage * image = [[UIImage imageNamed:imageArr[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * selectImage = [[UIImage imageNamed:selectImageArr[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        navigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArr[idx] image:image selectedImage:selectImage];
        //左边标示
        UIImageView * leftView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:headImageArr[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        leftView.tintColor = [UIColor whiteColor];
        UIBarButtonItem * imageItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        label.text = titleArr[idx];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:20];
        UIBarButtonItem * labelItem = [[UIBarButtonItem alloc]initWithCustomView:label];
        viewController.navigationItem.leftBarButtonItems = @[imageItem,labelItem];
        
        //右边菜单按钮
        _RightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _RightBtn.frame = CGRectMake(0, 0, 8, 36);
        _RightBtn.tag=idx;
        [_RightBtn setBackgroundImage:[[UIImage imageNamed:@"head_icon_right"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _RightBtn.selected = YES;
        [_RightBtn addTarget:self action:@selector(addOtherView:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:_RightBtn];
        viewController.navigationItem.rightBarButtonItem = rightItem;
        
        
        [nvArr addObject:navigation];
        
    }];
    
    self.viewControllers = nvArr;
}


-(void)addOtherView:(UIButton *)item {
    //163 × 156   menubg@3x
    if (_RightBtn.selected) {
        self.menuM = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen)];
        self.menuM.userInteractionEnabled = YES;
        [self.view addSubview:self.menuM];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeView:)];
        [self.menuM addGestureRecognizer:tap];
        
        _menuV = [[UIImageView alloc]initWithFrame:CGRectMake(width_screen-163/2-5, 64, 163/2, 156/2)];
        _menuV.image = [[UIImage imageNamed:@"menubg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _menuV.userInteractionEnabled = YES;
        [self.menuM addSubview:_menuV];
        
    }else{
        [_menuV removeFromSuperview];
    }
   
    _RightBtn.selected = !_RightBtn.selected;

    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 163/2, 156/4);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [leftBtn setTitle:@"知识库" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(zhishiku:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 156/4, 163/2, 156/4);
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitle:@"审核" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(shenHeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [_menuV addSubview:leftBtn];
    [_menuV addSubview:rightBtn];
    
    _flag = item.tag;
}

-(void)removeView:(UITapGestureRecognizer *)tap{
    _RightBtn.selected = !_RightBtn.selected;
    [self.menuM removeFromSuperview];
}
-(void)shenHeBtn:(UIButton *)btn{
    
    NSLog(@"审核");
    [_menuV removeFromSuperview];
    _RightBtn.selected = !_RightBtn.selected;
    ShenHeViewController*shenheVc=[ShenHeViewController new];
    shenheVc.hidesBottomBarWhenPushed=YES;
    UINavigationController * nav = [self.viewControllers objectAtIndex:_flag];
    [nav pushViewController:shenheVc animated:YES];
    
}

-(void)zhishiku:(UIButton *)btn{
    NSLog(@"知识库");
    
    [_menuV removeFromSuperview];
    _RightBtn.selected = !_RightBtn.selected;
    
    KnowledgeViewController * knowledgeVC = [[KnowledgeViewController alloc]init];
    knowledgeVC.hidesBottomBarWhenPushed = YES;
    
    UINavigationController * nav = [self.viewControllers objectAtIndex:_flag];
    [nav pushViewController:knowledgeVC animated:YES];
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

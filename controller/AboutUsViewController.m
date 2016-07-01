//
//  AboutUsViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1];
    [self addRightItem];
    [self addUI];
}

-(void)addUI{
    UILabel * topLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width_screen, 41)];
    topLabel.text = @"  关于稻田金服";
    topLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topLabel];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 41, width_screen-20, height_screen-41-64)];
    label.text = @"爱护肤我傲风宏伟覅还哦啊发hi欧佛is分his对\n符合双方还是地方和司法和覅偶发回合肥是\n爱护肤我傲风宏伟覅还哦啊发hi欧佛is分his对符合双方还是地方和司法和覅偶发回合肥是爱护肤我傲风宏伟覅还哦啊发hi欧\n佛啊发hi欧佛is分his对\n符合双方还是地方和司法和覅偶发回合肥是\n爱护肤我傲风宏伟覅还哦啊发hi欧佛is分his对符合双方还是地方和司法和覅偶发回合肥是爱护肤我傲风宏伟覅还哦啊啊发hi欧佛is分his对\n符合双方还是地方和司法和覅偶发回合肥是\n爱护肤我傲风宏伟覅还哦啊发hi欧佛is分his对符合双方还是地方和司法和覅偶发回合肥是爱护肤我傲风宏伟覅还哦啊啊发hi欧佛is分his对\n符合双方还是地方和司法和覅偶发回合肥是\n爱护肤我傲风宏伟覅还哦啊发hi欧佛is分his对符合双方还是地方和司法和覅偶发回合肥是爱护肤我傲风宏伟覅还哦啊啊发hi欧佛is分his对\n符合双方还是地方和司法和覅偶发回合肥是\n爱护肤我傲风宏伟覅还哦啊发hi欧佛is分his对符合双方还是地方和司法和覅偶发回合肥是爱护肤我傲风宏伟覅还哦啊";
    
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

#pragma mark == 左边 右边
-(void)addRightItem{

    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"关于我们" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];

}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}











@end

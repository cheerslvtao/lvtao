//
//  GanXiRenViewController.m
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "GanXiRenViewController.h"

@interface GanXiRenViewController ()

@end

@implementation GanXiRenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self addRightItem];
    // Do any additional setup after loading the view.
}
#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"干系人" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
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

//
//  ShenHeViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/15.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "ShenHeViewController.h"

@interface ShenHeViewController ()

@end

@implementation ShenHeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title=@"审核";
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
    // Do any additional setup after loading the view.
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

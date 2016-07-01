//
//  CheckingViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/14.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "CheckingViewController.h"
#import "AppDelegate.h"
#import "CompeteCheckViewController.h"
@interface CheckingViewController ()

@end

@implementation CheckingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createAd];
    [self createButton];
    [self addLeftItem];
}

-(void)addLeftItem{
    UIImageView * image = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, 35*2/3, 22)];
    image.image = [UIImage imageNamed:@"head_icon_sh"];
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    label.text = @"审核中" ;
    label.textColor = [UIColor whiteColor];
    
    label.font = [UIFont boldSystemFontOfSize:18];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:image];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:label];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)createAd{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20, self.view.bounds.size.width-60, 30)];
    label.text = @"非常感谢您的注册！！！";
    label.textColor = [UIColor LowBlueColor];
    label.font = [UIFont boldSystemFontOfSize:21];
    label.adjustsFontSizeToFitWidth =YES;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, self.view.bounds.size.width-60, 100)];
    label1.text = @"我们将在三个工作日内完成审核。\n如有任何问题请拨打我们的热线电话：\n1234567890";
    label1.adjustsFontSizeToFitWidth =YES;
    label1.textColor = [UIColor grayColor];
    label1.numberOfLines = 0;
    [self.view addSubview:label1];

    
}


-(void)createButton{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 160, width_screen-20, 40);
    [btn setTitle:@"资料审核中" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor LowBlueColor];
    btn.layer.cornerRadius = 5 ;
    [btn addTarget:self action:@selector(playInp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)playInp{
    /*
     [UIView animateWithDuration:3 animations:^{
     self.view.alpha = 0 ;
     } completion:^(BOOL finished) {
     [self dismissViewControllerAnimated:NO completion:nil];
     AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
     NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
     [user setObject:@(YES) forKey:@"status2"];
     [appDelegate statusOfUser];
     }];
     */
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"信息审核中，请耐心等待" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        CompeteCheckViewController * vc =[CompeteCheckViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
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

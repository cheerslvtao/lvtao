//
//  CompeteCheckViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/28.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "CompeteCheckViewController.h"
#import "AppDelegate.h"
@interface CompeteCheckViewController ()

@end

@implementation CompeteCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor LowWhileColor];
    
    [self createAd];
    [self createButton];
    [self addLeftItem];
}

-(void)addLeftItem{
    UIImageView * image = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, 35*2/3, 22)];
    image.image = [UIImage imageNamed:@"head_icon_sh"];
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    label.text = @"审核完成" ;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:image];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:label];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)createAd{
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(30, 20, self.view.bounds.size.width-60, 30)];
    label.text = @"您的申请已通过审核!";
    label.textColor = [UIColor LowBlueColor];
    label.font = [UIFont boldSystemFontOfSize:21];
    label.adjustsFontSizeToFitWidth =YES;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, self.view.bounds.size.width-60, 30)];
    label1.text = @"从现在开始可以使用稻田金服了！";
    label1.adjustsFontSizeToFitWidth =YES;
    label1.textColor = [UIColor grayColor];
    label1.numberOfLines = 0;
    [self.view addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    label2.text = @"  用户须知：";
    label2.backgroundColor = [UIColor whiteColor];
    label2.adjustsFontSizeToFitWidth =YES;
    label.font = [UIFont boldSystemFontOfSize:19];
    [self.view addSubview:label2];
    
    UILabel * label3 = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, self.view.bounds.size.width-60, 180)];
    label3.text = @"1.希望您的手机能够保持联网状态，这样可以及时给你发送订单信息\n2.希望您能打开GPS服务，这样可以给您发送距离最近的订单\n3.如果有任何问题可以通过“我”->“设置”->“平台联系方式”所列的联系方式联系我们。";
    label3.adjustsFontSizeToFitWidth =YES;
    label3.textColor = [UIColor grayColor];
    label3.numberOfLines = 0;
    [self.view addSubview:label3];
    
    
}

#pragma mark == 开始使用按钮
-(void)createButton{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 340, width_screen-20, 40);
    [btn setTitle:@"开始使用" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor LowBlueColor];
    btn.layer.cornerRadius = 5 ;
    [btn addTarget:self action:@selector(playInp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)playInp{
    
     [UIView animateWithDuration:2 animations:^{
         self.view.alpha = 0 ;
         self.view.transform = CGAffineTransformScale(self.view.transform, 2, 2);
     } completion:^(BOOL finished) {
         [self dismissViewControllerAnimated:NO completion:nil];
         AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
         NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
         [user setObject:@(YES) forKey:@"status4"];
         [appDelegate statusOfUser];
     }];
    
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

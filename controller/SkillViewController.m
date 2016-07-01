//
//  SkillViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "SkillViewController.h"

@interface SkillViewController ()


@end

@implementation SkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addView];
    [self addRightItem];
}

-(void)addView{
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1];
    
    NSArray * arr = @[@"Java",@"Android",@"Oracle",@"Python"];
    for (int i =0; i<arr.count; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 25+51*i, width_screen, 50)];
        label.text = [NSString stringWithFormat:@"  %@",arr[i]];
        label.backgroundColor = [UIColor whiteColor];
        label.userInteractionEnabled  = YES;
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(width_screen-60, 5, 40, 41);
        btn.backgroundColor = [UIColor whiteColor];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateSelected];
       
        [btn addTarget:self action:@selector(selectSkill:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:label];
        [label addSubview:btn];
    }
}

-(void)selectSkill:(UIButton *)btn{
    btn.selected = !btn.selected;
}


#pragma mark == 左边 右边 编辑按钮
-(void)addRightItem{
    //右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 35);
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 0.4;
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btn addTarget:self action:@selector(competition) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"职业技能" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];

}

-(void)competition{
    //完成
    [self.navigationController popViewControllerAnimated:YES];

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

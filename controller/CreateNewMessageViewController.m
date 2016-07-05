//
//  CreateNewMessageViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/7/5.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "CreateNewMessageViewController.h"

@interface CreateNewMessageViewController ()<UITextViewDelegate>

@property (nonatomic,copy) UITextView * textView;

@end

@implementation CreateNewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor LowWhileColor];
    [self addRightItem];
    [self.view addSubview:self.textView];
}

#pragma mark == 左边 右边
-(void)addRightItem{
    
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:self.backTitle imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
    
    //右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 35);
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 0.4;
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btn addTarget:self action:@selector(backMine) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)backMine{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITextView *)textView{
    
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 25, width_screen-20,150)];
        _textView.textColor = [UIColor grayColor];
        _textView.text = self.contenStr;
        _textView.font = [UIFont systemFontOfSize:16];
    }
    return _textView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end

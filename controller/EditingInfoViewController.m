//
//  EditingInfoViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "EditingInfoViewController.h"

@interface EditingInfoViewController ()<UITextFieldDelegate>
{
    CGFloat keyboardHeight;
    CGFloat durationTime;
}

@end

@implementation EditingInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTextField];
    [self addRightItem];
}

#pragma mark ==导航条按钮
-(void)addRightItem{
    //右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 35);
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 0.4;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btn addTarget:self action:@selector(competition) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backUserBase)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"编辑基础信息" imageViewName:nil actionYESorNO:NO target:self action:@selector(backUserBase)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];

}

-(void)competition{
    
    //编辑完成后将修改的数据存储到服务器和本地
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backUserBase{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ==添加textfield
-(void)addTextField{
    
    for (int i=0; i<self.dataArr.count; i++) {
        UITextField * field = [[UITextField alloc]initWithFrame:CGRectMake(10, 20+55*i, width_screen-20, 40)];
        field.placeholder = self.dataArr[i];
        field.delegate =self;
        field.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:field];
    }
    
    
}



#pragma mark == 处理键盘覆盖问题  textfiled代理方法
-(void)viewWillAppear:(BOOL)animated{
    //使用NSNotificationCenter 键盘出现时
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    //使用NSNotificationCenter 键盘隐藏时
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
}

//实现当键盘出现的时候计算键盘的高度大小。用于输入框显示位置
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即为键盘尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到键盘的高度
    durationTime = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]; //得到键盘动画时间
    NSLog(@"time : %f",durationTime);
    NSLog(@"++height:%f",kbSize.height);
    keyboardHeight = kbSize.height;
}

//当键盘隐藏的时候
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即为键盘尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"--height:%f",kbSize.height);
    keyboardHeight = kbSize.height;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (self.view.frame.size.height - keyboardHeight <= textField.frame.origin.y + textField.frame.size.height) {
        CGFloat y = textField.frame.origin.y - (self.view.frame.size.height - keyboardHeight - textField.frame.size.height - 5);
        [UIView animateWithDuration:durationTime animations:^{
            self.view.frame = CGRectMake(self.view.frame.origin.x, -y, self.view.frame.size.width, self.view.frame.size.height);
        }];
        
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:durationTime animations:^{
        self.view.frame = CGRectMake(self.view.frame.origin.x, 64, width_screen, self.view.frame.size.height);
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



@end

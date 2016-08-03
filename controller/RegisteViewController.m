//
//  RegisteViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/14.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "RegisteViewController.h"
#import "RegisteViewController2.h"
@interface RegisteViewController ()<UITextFieldDelegate>
{
    CGFloat keyboardHeight;
    CGFloat durationTime;
}

@end

@implementation RegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor LowWhileColor];
    [self createUI]; //创建UI
    [self addLeftItem];
}

-(void)addLeftItem{
    UIImageView * image = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, 35*2/3, 22)];
    image.image = [UIImage imageNamed:@"head_icon_sh"];
    
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    label.text = @"新用户注册" ;
    label.textColor = [UIColor whiteColor];
    
    label.font = [UIFont boldSystemFontOfSize:18];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc]initWithCustomView:image];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:label];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}
#pragma mark == 创建UI
-(void)createUI {
    
    UILabel *label= [[UILabel alloc]initWithFrame:CGRectMake(10, 0, width_screen, 40)];
    label.text = @"第一步：填写基本资料";
    [self.view addSubview:label];
    NSArray * placeholders = @[@"姓   名",@"工   号",@"手机号",@"密   码",@"验证码"];
    
    for (int i =0 ; i < 5; i++) {
        
        if(i == 4){
            UITextField * filed = [[UITextField alloc]initWithFrame:CGRectMake(10, 40+i*55, (width_screen-20)*2/3, 40)];
            filed.borderStyle =UITextBorderStyleRoundedRect;
            filed.placeholder = placeholders[i]; //占位文字
            filed.delegate = self; //设置代理
            filed.backgroundColor=[UIColor whiteColor];
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"获取验证码" forState:UIControlStateNormal];
            button.layer.cornerRadius = 5 ; //削圆
            button.backgroundColor = [UIColor lightGrayColor];
            button.frame =CGRectMake(10+(width_screen-20)*2/3+10, 40+i*55, (width_screen-20)/3-10, 40);
            button.titleLabel.font =[UIFont boldSystemFontOfSize:16];
            [button addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
            button.backgroundColor = [UIColor grayColor];
            
            [self.view addSubview:button];
            [self.view addSubview:filed];
        }else{
            UITextField * filed = [[UITextField alloc]initWithFrame:CGRectMake(10, 40+i*55, width_screen-20, 40)];
            filed.borderStyle =UITextBorderStyleRoundedRect;
            filed.placeholder = placeholders[i]; //占位文字
            filed.backgroundColor=[UIColor whiteColor];

            filed.delegate = self; //设置代理
            [self.view addSubview:filed];
        }
        
    }
    
    //下一步
    UIButton * nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake(10, 40+4*55+70, width_screen - 20, 40);
    [nextBtn addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
    nextBtn.layer.cornerRadius = 5;
    nextBtn.backgroundColor  =[UIColor LowBlueColor];
    [self.view addSubview:nextBtn];
    
    //热线电话
    UILabel * phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, height_screen-30-64, width_screen, 30)];
    phoneLabel.text = @"热线电话：123-456-7890";
    phoneLabel.textAlignment = NSTextAlignmentCenter;
    phoneLabel.font = [UIFont systemFontOfSize:13];
    phoneLabel.textColor = [UIColor grayColor];
    [self.view addSubview:phoneLabel];
    
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
        self.view.frame = CGRectMake(self.view.frame.origin.x, 64, self.view.frame.size.width, self.view.frame.size.height);
    }];
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


-(void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

#pragma mark == 获取验证码
-(void)getCode{
    NSLog(@"获取验证码");

}

#pragma mark == 下一步
-(void)nextVC{
    RegisteViewController2 * vc2 = [[RegisteViewController2 alloc ]init];
    [self.navigationController pushViewController:vc2 animated:YES];
}


#pragma mark == 收起键盘
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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

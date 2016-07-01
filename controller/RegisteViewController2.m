//
//  RegisteViewController2.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/14.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "RegisteViewController2.h"
#import "CheckingViewController.h"
@interface RegisteViewController2 ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UIImageView * minePhoto;

@end

@implementation RegisteViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    [self getPhoto];
    self.view.backgroundColor = [UIColor LowWhileColor];
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

#pragma mark == 获取照片
-(void)getPhoto{
    
    
    UILabel *label= [[UILabel alloc]initWithFrame:CGRectMake(10, 0, width_screen, 66)];
    label.text = @"第二步：上传头像";
    [self.view addSubview:label];
    
    
    self.minePhoto = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    self.minePhoto.backgroundColor = [UIColor whiteColor];
    self.minePhoto.userInteractionEnabled =YES; //打开用户交互
    float screen_width = self.view.bounds.size.width;
    self.minePhoto.frame = CGRectMake(10, 66, screen_width-20, (screen_width-20)*521/671);
    [self.view addSubview:self.minePhoto];
    
    UIButton * selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(self.minePhoto.center.x - 186/4, self.minePhoto.center.y -66- 152/4-20, 186/2, 152/2);
    [selectBtn setBackgroundImage:[UIImage imageNamed:@"sctp"] forState:UIControlStateNormal];
    [selectBtn addTarget:self action:@selector(selectPhoto) forControlEvents:UIControlEventTouchUpInside];
    [self.minePhoto addSubview:selectBtn];
    
    UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.minePhoto.center.x - 186/4-25, self.minePhoto.center.y -66+ 152/4-20, 186/2+50, 20)];
    label1.text = @"点击上传图片";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor lightGrayColor];
    [self.minePhoto addSubview:label1];
    
//    671 521
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, (screen_width-20)*521/671+66+30, screen_width-20, 40);
    [button setTitle:@"完成" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor LowBlueColor];
    button.layer.cornerRadius = 5 ;
    [button addTarget:self action:@selector(finishRegiste) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


#pragma mark == 点击图片选择头像
-(void)selectPhoto{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self pikePhoto:UIImagePickerControllerSourceTypeCamera];
        }else{
            NSLog(@"没有找到相关设备");
        }
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self pikePhoto:UIImagePickerControllerSourceTypePhotoLibrary];
        
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)pikePhoto:(UIImagePickerControllerSourceType)sourceType {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    
    [self presentViewController:imagePickerController animated:YES completion:^{
        
    }];
}

#pragma mark ==代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self.minePhoto.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.minePhoto.image = image;
}

#pragma mark == 完成注册
-(void)finishRegiste{
    
    //这里写完成注册需要做的事情
    //根据需求点击完成之后要跳到资料审核界面，审核期间app将一直停留在“审核中”界面。直到审核完成界面才会显示审核成功或者审核失败。
    //审核失败后则会重新跳转至注册界面方便用户重新填写注册信息
    //审核成功后跳转至app主界面，界面包含用户须知，以及“开始使用”按钮，用户点击按钮进入首页。
    
    CheckingViewController * vc = [[CheckingViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dd{
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"选择图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相机"
                                                style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction * _Nonnull action) {
                    //写相关代码
        
           }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册"
                                                style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction * _Nonnull action) {
        
        //写相关代码
        
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消"
                                                style:UIAlertActionStyleCancel
                                              handler:^(UIAlertAction * _Nonnull action) {
        //写相关代码
    }]];
    
    //弹出视图
    [self presentViewController:alertVC animated:YES completion:nil];
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

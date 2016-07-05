//
//  UserBaseInfoViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/24.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "UserBaseInfoViewController.h"
#import "EditingInfoViewController.h"
@interface UserBaseInfoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIImageView * userHeaderView;

@end

@implementation UserBaseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate =self;

    _dataArr = [[NSMutableArray alloc]initWithObjects:@"工号：123456789",@"岗位：首席质量官",@"资金账号：123456789123456",@"身份证：130130133013131313",@"当前住址：石家庄长安区时代方舟",@"紧急联系人：张三",@"紧急联系人电话：1881888389387", nil];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.userBaseTable];
    [self addRightItem];
    
}

#pragma mark == 左边 右边 编辑按钮
-(void)addRightItem{
    //右边
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 45, 35);
    [btn setTitle:@"编辑" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 0.4;
    btn.layer.cornerRadius = 4;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btn addTarget:self action:@selector(editing) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item =[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"基础信息" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)editing{
    EditingInfoViewController * vc = [EditingInfoViewController new];
    vc.dataArr = self.dataArr;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITableView *)userBaseTable{
    if (!_userBaseTable) {
        _userBaseTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen-64) style:UITableViewStylePlain];
        _userBaseTable.showsVerticalScrollIndicator = NO;
        _userBaseTable.delegate =self;
        _userBaseTable.dataSource =self;
        _userBaseTable.bounces = NO;
    }
    return _userBaseTable;
}

#pragma mark == table代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return height_screen/3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * userBase = @"userBase";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:userBase];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:userBase];
    }
    
    //添加副文本
    NSRange range = [self.dataArr[indexPath.row] rangeOfString:@"："];
    NSLog(@"=======%@",NSStringFromRange(range));
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc]initWithString:self.dataArr[indexPath.row]];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(range.location+1,[self.dataArr[indexPath.row] length]-range.location-1 )];
    
    
    cell.textLabel.attributedText =attStr;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark == 自定义区头 设置头像
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen/3)];
    view.backgroundColor =[UIColor lightGrayColor];
    
    self.userHeaderView = [[UIImageView alloc]initWithFrame:CGRectMake(view.center.x-(view.frame.size.height-60)/2, 20, view.frame.size.height-60, view.frame.size.height-60)];
    self.userHeaderView .image = [UIImage imageNamed:@""];
    self.userHeaderView .backgroundColor = [UIColor redColor];
    
    self.userHeaderView .userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectPhoto:)];
    [self.userHeaderView  addGestureRecognizer:tap];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(view.center.x-(view.frame.size.height-60)/2, view.frame.size.height-40, view.frame.size.height-60, 40)];
    label.text = @"点击图片上传";
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    
    [view addSubview:label];
    [view addSubview:self.userHeaderView ];
    return view;
    
}

#pragma mark == 点击图片选择头像
-(void)selectPhoto:(UITapGestureRecognizer *)tap{
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
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.userHeaderView.image  = image;
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

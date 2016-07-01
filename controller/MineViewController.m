//
//  MineViewController.m
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/24.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "MineViewController.h"
#import "MineTopCell.h"
#import "UserBaseInfoViewController.h"
#import "ContactViewController.h"
#import "SkillViewController.h"
#import "NoticeViewController.h"
#import "AboutUsViewController.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * mineTableView;

@property (nonatomic,strong) NSArray * memberArr;

@property (nonatomic,strong) NSArray * imageArr;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mineTableView];
    [self version];
}

-(UITableView *)mineTableView{
    if (!_mineTableView) {
        _mineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, width_screen , height_screen-64-48) style:UITableViewStylePlain];
        _mineTableView.delegate = self;
        _mineTableView.dataSource = self;
        _mineTableView.showsVerticalScrollIndicator = NO;
        _mineTableView.bounces = NO;
        _mineTableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        [_mineTableView registerNib:[UINib nibWithNibName:@"MineTopCell" bundle:nil] forCellReuseIdentifier:@"MineTopCell"];
    }
    return _mineTableView;
}

#pragma mark == tableView delegate
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
        return 120;
    }else{
        return 55;
    }
}

//每个区cell数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.imageArr.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15; //去偷高度
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1; //区尾高度
}

//区 数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MineTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MineTopCell"];
        return cell;
    }else{
        static NSString * str = @"minecell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.memberArr[indexPath.row];
        cell.imageView.image = [[UIImage imageNamed:self.imageArr[indexPath.row]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        UserBaseInfoViewController * userVC = [[UserBaseInfoViewController alloc]init];
        userVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userVC animated:YES];
    }else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        switch (indexPath.row) {
            case 0:
            {
                ContactViewController * vc = [ContactViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1:
            {
                SkillViewController * vc = [SkillViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];

            }
                break;
            case 2:
            {
                NoticeViewController * vc = [NoticeViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];

            }
                break;
            case 3:
            {
                AboutUsViewController * vc = [AboutUsViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];

            }
                break;
            default:
                break;
        }

    }
    
}
#pragma mark == 初始化数组cell标题 和 图片
-(NSArray *)memberArr{
    if (!_memberArr) {
        _memberArr = [[NSArray alloc]initWithObjects:@"联系方式",@"职业技能",@"系统公告",@"关于我们", nil];
    }
    return _memberArr;
}
-(NSArray *)imageArr{
    if (!_imageArr) {
        _imageArr = [[NSArray alloc]initWithObjects:@"grzx_lxfs",@"grzx_zyjn",@"grzx_xtgg",@"grzx_gywm", nil];
    }
    return _imageArr;
}


#pragma mark == 获取版本号
-(void)version{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"当前应用软件版本:%@",appCurVersion);
    // 当前应用版本号码   int类型
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"当前应用版本号码：%@",appCurVersionNum);
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer=[AFHTTPRequestSerializer serializer];
    
    [manager GET:@"" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 对比版本号   是否要更新
        if (1){
            //如果需要更新  提示用户更新软件
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"亲，有新的版本需更新" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"不更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"去更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                /*
                 1.进入appstore中指定的应用
                 NSString *str = [NSString stringWithFormat:
                 @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa /wa/viewContentsUserReviews?type=Purple+Software&id=%d",
                 myAppID ];
                 
                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
                 
                 其中myAppID为itunesconnect中的应用程序id
                 */
                
            }]];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       
        NSLog(@"获取版本信息失败");

    }];
}


@end

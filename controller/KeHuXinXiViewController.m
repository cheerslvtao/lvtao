//
//  KeHuXinXiViewController.m
//  金服
//
//  Created by 王旭阳 on 16/6/15.
//  Copyright © 2016年 王旭阳. All rights reserved.
//

#import "KeHuXinXiViewController.h"
#import "Masonry.h"
@interface KeHuXinXiViewController ()

@end

@implementation KeHuXinXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255.0 green:246.0/255.0 blue:247.0/255.0 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor=[UIColor whiteColor];
    _tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 84, [UIScreen mainScreen].bounds.size.width, 44*3+155)];
    
    _tabView.dataSource=self;
    _tabView.delegate=self;
    _tabView.scrollEnabled = NO;

    _tabView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);

    [self.view addSubview:_tabView];
    [self addRightItem];
    
//    UILabel*lab=[UILabel new];
//    NSString*str=@"    注意事项:\n\t中国原创歌词音乐网提供最新、最热、最流行的在线音乐网-致力于打造最专业的歌曲大全,原创音乐,原创歌曲,原创歌词,填词,写歌词,作曲,编曲,伴奏,诗词,翻唱网,midi";
//    NSRange range = [str rangeOfString:@":"];
//
//    NSMutableAttributedString*attStr=[[NSMutableAttributedString alloc]initWithString:str];
//
//    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(range.location+1,attStr.length-range.location-1)];
//    
//
//    lab.attributedText=attStr;
//lab.lineBreakMode = UILineBreakModeWordWrap;
//    lab.numberOfLines = 0;
//    lab.backgroundColor=[UIColor whiteColor];
//
//    [self.view addSubview:lab];
//    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_tabView.mas_bottom).offset(1);        make.left.offset(12);
//        make.right.offset(-12);
//    }];
//    NSArray*weiwanchengArr=@[@"公司名称:石家庄稻田网络公司",@"公司地址:石家庄时代方舟b座906",@"联系人:小明",@"注意事项:中国原创歌词音乐网提供最新、最热、最流行的在线音乐网-致力于打造最专业的歌曲大全,原创音乐,原创歌曲,原创歌词,填词,写歌词,作曲,编曲,伴奏,诗词,翻唱网,midi",];
//    for (int i=0; i<4; i++) {
//        UILabel*lab=[UILabel new];
//        lab.text=weiwanchengArr[i];
//        lab.backgroundColor=[UIColor whiteColor];
//        lab.lineBreakMode = UILineBreakModeWordWrap;
//        lab.numberOfLines = 0;
//        CGSize maximumLabelSize = CGSizeMake(100, 9999);//
//             //关键语句
//             CGSize expectSize = [lab sizeThatFits:maximumLabelSize];
//        
//        
//        [self.view addSubview:lab];
//        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.offset(80.0f+30*i);
//            make.left.offset(10.0f);
//            make.right.offset(-10);
//            make.height.offset(expectSize.width);
//            make.width.offset(expectSize.width);
//        }];
//    }
    
    
}

#pragma mark == 左边 右边
-(void)addRightItem{
    //左边
    UIButton * btn1 = [UIKitFactory addLeftNavigationItemWithTitle:nil imageViewName:@"head_icon_back" actionYESorNO:YES target:self action:@selector(backMine)];
    UIButton * btn2 = [UIKitFactory addLeftNavigationItemWithTitle:@"客户信息" imageViewName:nil actionYESorNO:NO target:self action:@selector(backMine)];
    UIBarButtonItem  * item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

-(void)backMine{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==3) {
        return 125;
    }else{
        return 44;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==3) {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.textLabel.numberOfLines=0;
        NSString*str=@"注意事项:\n\t中国原创歌词音乐网提供最新、最热、最流行的在线音乐网-致力于打造最专业的歌曲大全,原创音乐,原创歌曲,原创歌词,填词,写歌词,作曲,编曲,伴奏,诗词,翻唱网,midi";
        NSRange range = [str rangeOfString:@":"];
        
        NSMutableAttributedString*attStr=[[NSMutableAttributedString alloc]initWithString:str];
        
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(range.location+1,attStr.length-range.location-1)];

        cell.textLabel.attributedText=attStr;
        return cell;
    }

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    NSString*gongsiStr=@"公司名称:石家庄稻田网络";

 //    NSString*dizhiStr=@"石家庄时代方舟";
//    NSString*nameStr=@"王旭阳";
//    NSArray*infoArr=@[gongsiStr,dizhiStr,nameStr];
    
    NSArray*titleArr=@[@"公司名称: 石家庄稻田网络王 ",@"公司地址: 石家庄时代方舟 ",@"联系人: 王旭阳"];
    NSString*titiStr=titleArr[indexPath.row];
    NSRange range = [titiStr rangeOfString:@":"];
    
    NSLog(@"Range is: %@", NSStringFromRange(range));
    NSMutableAttributedString*attStr=[[NSMutableAttributedString alloc]initWithString:titiStr];
    NSLog(@"----->>>>%@",attStr);
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(range.location+1, titiStr.length-range.location-1)];
    
        [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(range.location+1, titiStr.length-range.location-1)];
    

    cell.selectionStyle=UITableViewCellAccessoryNone;

    cell.textLabel.attributedText=attStr;
    return cell;
    
    

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

//
//  UserBaseInfoViewController.h
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/24.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserBaseInfoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray * dataArr;

@property (nonatomic,strong) UITableView * userBaseTable;


@end

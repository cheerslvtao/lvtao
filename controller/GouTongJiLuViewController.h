//
//  GouTongJiLuViewController.h
//  daotianjinfu
//
//  Created by 王旭阳 on 16/6/27.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GouTongJiLuViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tabView;
@property(nonatomic,copy)NSArray*dataArr;
@property(nonatomic,copy)NSArray*infoArr;
@end

//
//  FuWuDanViewController.h
//  金服
//
//  Created by 王旭阳 on 16/6/15.
//  Copyright © 2016年 王旭阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FuWuDanViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tabView;
@property(nonatomic,strong)UITableView*wanchengtabView;
@end

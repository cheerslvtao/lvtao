//
//  IncomeCell.h
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/15.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *company;
@property (weak, nonatomic) IBOutlet UILabel *order;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *score;

@end

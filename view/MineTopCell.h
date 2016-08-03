//
//  MineTopCell.h
//  daotianjinfu
//
//  Created by 吕涛 on 16/6/24.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineTopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *accountNumber;
@property (weak, nonatomic) IBOutlet UILabel *workerNumber;
@property (weak, nonatomic) IBOutlet UILabel *station;

@end

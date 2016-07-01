//
//  UIKitFactory.h
//  XZCYone
//
//  Created by 吕涛 on 16/6/17.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIKitFactory : NSObject

+(UIButton *)UIButtonWithFrame:(CGRect)frame
                         Title:(NSString *)title
                        action:(SEL)action
                         taget:(id)target;

/**
 *
 *
 */
+(UILabel *)UILabelWithFrame:(CGRect)frame
                       Title:(NSString *)title
                        font:(CGFloat)font;


/**
 * 返回一个数组 带两个View
 *
 */
+(UIButton * )addLeftNavigationItemWithTitle:(NSString *)title
                        imageViewName:(NSString *)ImageName
                        actionYESorNO:(BOOL)action
                               target:(id)target
                               action:(SEL)sel;

@end

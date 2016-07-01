//
//  UIKitFactory.m
//  XZCYone
//
//  Created by 吕涛 on 16/6/17.
//  Copyright © 2016年 吕涛. All rights reserved.
//

#import "UIKitFactory.h"

@implementation UIKitFactory

+(UIButton *)UIButtonWithFrame:(CGRect)frame
                         Title:(NSString *)title
                        action:(SEL)action
                         taget:(id)target{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


+(UILabel *)UILabelWithFrame:(CGRect)frame
                       Title:(NSString *)title
                        font:(CGFloat)font{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = title;
    
    if (font) {
        label.font = [UIFont systemFontOfSize:font];
    }
    return label;
}

+(UIButton *)addLeftNavigationItemWithTitle:(NSString *)title
                        imageViewName:(NSString *)ImageName
                        actionYESorNO:(BOOL)action
                               target:(id)target
                               action:(SEL)sel
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (action){
        btn.frame = CGRectMake(0, 0, 12, 22);
    }else{
        if (title.length >= 5) {

            btn.frame = CGRectMake(0, 0, 110, 44);
        }else{

            btn.frame = CGRectMake(0, 0, 80, 44);
        }
    }
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:ImageName]  forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}



@end

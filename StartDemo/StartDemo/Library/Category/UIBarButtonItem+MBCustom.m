//
//  UIBarButtonItem+MBCustom.m
//  StartDemo
//
//  Created by 王战胜 on 2017/12/5.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "UIBarButtonItem+MBCustom.h"


@implementation UIBarButtonItem (MBCustom)
//自定义标题，以及颜色 返回按钮
+(UIBarButtonItem *)itmeWithNormalImage:(UIImage *)normalImage high:(UIImage *)highImage target:(nullable id)target action:(nullable SEL)action norColor:(UIColor *)norColor highColor:(UIColor *)highColor title:(NSString *)title{
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [customButton setImage:normalImage forState:UIControlStateNormal];
    [customButton setImage:highImage forState:UIControlStateHighlighted];
    
    [customButton setTitleColor:norColor forState:UIControlStateNormal];
    [customButton setTitleColor:highColor forState:UIControlStateHighlighted];
    
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton sizeToFit];
    [customButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:customButton];
    return item;
}
@end

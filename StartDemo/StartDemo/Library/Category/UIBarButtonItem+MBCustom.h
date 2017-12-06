//
//  UIBarButtonItem+MBCustom.h
//  StartDemo
//
//  Created by 王战胜 on 2017/12/5.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MBCustom)
+(UIBarButtonItem *)itmeWithNormalImage:(UIImage *)normalImage high:(UIImage *)highImage target:(nullable id)target action:(nullable SEL)action norColor:(UIColor *)norColor highColor:(UIColor *)highColor title:(NSString *)title;

@end

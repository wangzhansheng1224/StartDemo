//
//  IMNSUserDefaultsTool.m
//  StartDemo
//
//  Created by 王战胜 on 2017/11/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "IMNSUserDefaultsTool.h"

@implementation IMNSUserDefaultsTool

+(id)objectForKey:(NSString *)defaultName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

+(void)setObject:(id)value forKey:(NSString *)defaultName{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}
@end

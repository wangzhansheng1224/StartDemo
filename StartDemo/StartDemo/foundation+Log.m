//
//  NSDictionary+Log.m
//  06- 掌握-多只参数和中文输出
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    //拼接字典中所有的键值对
    [str appendString:@"\n{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [str appendString:[NSString stringWithFormat:@"%@:",key]];
        [str appendString:[NSString stringWithFormat:@"%@,",obj]];
    }];
    [str appendString:@"}"];
    
    //NSBackwardsSearch从后往前搜索
    NSRange rang =  [str rangeOfString:@"," options:NSBackwardsSearch];
    if (rang.location != NSNotFound) {
        [str deleteCharactersInRange:rang];
    }
    
    return str;
}
@end

@implementation NSArray (Log)
-(NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    
    //拼接数组中所有的键值对
    [str appendString:@"["];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [str appendString:[NSString stringWithFormat:@"%@\n",obj]];
    }];
    
    [str appendString:@"]"];
    
    //NSBackwardsSearch从后往前搜索
    NSRange rang =  [str rangeOfString:@"," options:NSBackwardsSearch];
    if (rang.location != NSNotFound) {
        [str deleteCharactersInRange:rang];
    }
    
    return str;
}
@end

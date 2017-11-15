//
//  IMNSUserDefaultsTool.h
//  StartDemo
//
//  Created by 王战胜 on 2017/11/14.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMNSUserDefaultsTool : NSObject
+(id)objectForKey:(NSString *)defaultName;
+(void)setObject:(id)value forKey:(NSString *)defaultName;
@end

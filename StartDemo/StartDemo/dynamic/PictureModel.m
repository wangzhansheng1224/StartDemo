//
//  PictureModel.m
//  StartDemo
//
//  Created by 王战胜 on 2017/12/6.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "PictureModel.h"

@implementation PictureModel

//YYModel字段名替换方法
//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"Id":@"id",
//             @"PictureDescription":@"description",
//             @"photoUrl":@"photo_url",
//             @"tripId":@"trip_id"};
//}

//MJExtension字段名替换方法
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"Id":@"id",
             @"PictureDescription":@"description",
             @"photoUrl":@"photo_url",
             @"tripId":@"trip_id"
             };
}
@end

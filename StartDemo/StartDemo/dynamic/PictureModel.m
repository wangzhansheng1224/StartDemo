//
//  PictureModel.m
//  StartDemo
//
//  Created by 王战胜 on 2017/12/6.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "PictureModel.h"

@implementation PictureModel
//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"Id":@"id",
//             @"PictureDescription":@"description",
//             @"photoUrl":@"photo_url",
//             @"tripId":@"trip_id"};
//}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"Id":@"id",
             @"PictureDescription":@"description",
             @"photoUrl":@"photo_url",
             @"tripId":@"trip_id"
             };
}
@end

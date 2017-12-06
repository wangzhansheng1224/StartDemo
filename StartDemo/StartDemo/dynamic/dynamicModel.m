//
//  dynamicModel.m
//  StartDemo
//
//  Created by 王战胜 on 2017/12/6.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import "dynamicModel.h"


@implementation Picture
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"Id":@"id",
             @"PictureDescription":@"description",
             @"photoUrl":@"photo_url",
             @"tripId":@"trip_id"};
}
@end

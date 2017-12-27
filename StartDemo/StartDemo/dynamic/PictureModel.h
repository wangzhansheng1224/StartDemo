//
//  PictureModel.h
//  StartDemo
//
//  Created by 王战胜 on 2017/12/6.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PictureModel : NSObject
@property (nonatomic, assign) NSInteger Id;
@property (nonatomic, copy)   NSString *PictureDescription;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, copy)   NSString *photoUrl;
@property (nonatomic, assign) NSInteger tripId;
@end

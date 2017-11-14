//
//  UserModel.h
//  TabBarController
//
//  Created by 王战胜 on 2017/11/7.
//  Copyright © 2017年 gocomtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (nonatomic,assign) NSInteger userID;
@property (nonatomic,strong) NSString* nickName;
@property (nonatomic,strong) NSString* phone;
@property (nonatomic,strong) NSString* photo;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,strong) NSString* signature;
@property (nonatomic,assign) double balance;//余额
@property (nonatomic,assign) NSInteger level;//等级
@property (nonatomic,assign) double totalBalance;//总充值钱数
@property (nonatomic,assign) double nextBalance;//距离下一级，还需要充值多少钱
@property (nonatomic,assign) double discount;//当前优惠
@property (nonatomic,assign) double nextDiscount; //下一级优惠
//@property (nonatomic,strong) FamliyModel* myFamily;


+ (UserModel *)currentUser;
+ (void)save:(UserModel *)user;
+ (void)removeUser;
+ (BOOL)isHasLogin;
+ (UserModel*)JsonParse:(NSDictionary*)dic;
@end

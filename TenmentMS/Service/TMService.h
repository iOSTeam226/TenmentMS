//
//  TMService.h
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "BaseService.h"

//http://yonghao.hk13.0797114.net/Home/Login
#define TMS_LIST_URL @"http://yonghao.hk13.0797114.net/Village/Communities"
#define TMS_REGISTER_URL @"http://yonghao.hk13.0797114.net/Household/RegisterUser"
#define TMS_GETROLES_URL @"http://yonghao.hk13.0797114.net/Roles/GetRoles"


@interface TMService : BaseService

+(NSMutableArray *)tmsList;

+(BOOL)registerWithAccount:(NSString *)account name:(NSString *)uname pwd:(NSString *)password address:(NSString *)address temmentId:(int)villageid;


@end

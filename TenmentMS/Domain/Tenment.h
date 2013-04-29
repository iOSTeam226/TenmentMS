//
//  Tenment.h
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tenment : NSObject


@property(nonatomic,assign)int tenmentId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *imgPath;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *bqCompany;
@property(nonatomic,copy)NSString *jsCompany;
@property(nonatomic,copy)NSString *status;
@property(nonatomic,assign)float longitude;
@property(nonatomic,assign)float latitude;
@end

//
//  Tenment.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "Tenment.h"

@implementation Tenment
@synthesize tenmentId;
@synthesize name;
@synthesize imgPath;
@synthesize address;
@synthesize bqCompany;
@synthesize jsCompany;
@synthesize status;
@synthesize latitude;
@synthesize longitude;

-(void)dealloc{
    [name release];
    [imgPath release];
    [address release];
    [bqCompany release];
    [jsCompany release];
    [status release];
    [super dealloc];
}

@end

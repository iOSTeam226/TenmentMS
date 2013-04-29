//
//  TMService.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "TMService.h"
#import "Tenment.h"

@implementation TMService

+(NSMutableArray *)tmsList{
    NSString *responseString=[self getResponseWithUrl:TMS_LIST_URL];
    SBJSON *json=[[SBJSON alloc]init];
    NSArray *listArray=[json objectWithString:responseString];
    [json release];
    NSMutableArray *tenmentArray=[[NSMutableArray alloc]init];
    for(NSDictionary *tenDict in listArray){
        Tenment *tenment=[[Tenment alloc]init];
        tenment.tenmentId=[[tenDict objectForKey:@"id"] intValue];
        tenment.name=[tenDict objectForKey:@"name"];
        tenment.imgPath=[tenDict objectForKey:@"imgpath"];
        tenment.address=[tenDict objectForKey:@"address"];
        tenment.bqCompany=[tenDict objectForKey:@"bqCompany"];
        tenment.jsCompany=[tenDict objectForKey:@"jsCompany"];
        tenment.status=[tenDict objectForKey:@"status"];
        tenment.longitude=[[tenDict objectForKey:@"jd"] floatValue];
        tenment.latitude=[[tenDict objectForKey:@"wd"] floatValue];
        [tenmentArray addObject:tenment];
        [tenment release];
    }
    return [tenmentArray autorelease];
}

+(BOOL)registerWithAccount:(NSString *)account name:(NSString *)uname pwd:(NSString *)password address:(NSString *)address temmentId:(int)villageid{
    NSString *param=[NSString stringWithFormat:@"accont=%@&uname=%@&password=%@&address=%@&villageid=%d",account,uname,password,address,villageid];
    NSString *responseString=[self postRequest:TMS_REGISTER_URL withParam:param];
    NSLog(@"resp:%@",responseString);
    SBJSON *json=[[SBJSON alloc]init];
    NSDictionary *registerDict=[json objectWithString:responseString];
    [json release];
    BOOL success=[[registerDict objectForKey:@"status"] boolValue];
    return success;
    
}

@end

//
//  MemberViewController.h
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-16.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "BaseViewController.h"

@interface MemberViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray *memberInfoArray;
}

@end

//
//  RegisterViewController.h
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-18.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "BaseViewController.h"
#import "Tenment.h"

@interface RegisterViewController : BaseViewController{
    IBOutlet UILabel *infoLabel1;
    IBOutlet UILabel *infoLabel2;
    IBOutlet UILabel *infoLabel3;
    IBOutlet UITextField *accountTextField;
    IBOutlet UITextField *pwdTextField;
    IBOutlet UITextField *surePwdTextField;
    IBOutlet UITextField *nameTextField;
    IBOutlet UIButton *exitBtn;
    IBOutlet UIButton *registerBtn;
}

@property(nonatomic,copy)NSString *address;
@property(nonatomic,retain)Tenment *tenment;

-(IBAction)exitRegister:(id)sender;

-(IBAction)gotoRegister:(id)sender;

@end

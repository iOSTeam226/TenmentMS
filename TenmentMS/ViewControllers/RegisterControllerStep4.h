//
//  RegisterControllerStep4.h
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "BaseViewController.h"
#import "Tenment.h"

@interface RegisterControllerStep4 : BaseViewController<UITextFieldDelegate>{
    IBOutlet UIButton *continueBtn;
    IBOutlet UILabel *tenmentNameLabel;
    IBOutlet UIButton *provinceNameBtn;
    IBOutlet UIButton *provinceBtn;
    IBOutlet UIButton *cityNameBtn;
    IBOutlet UIButton *cityBtn;
    IBOutlet UIButton *townNameBtn;
    IBOutlet UIButton *townBtn;
    IBOutlet UITextField *addressTextField;
    IBOutlet UIButton *addreddBtn;
    IBOutlet UILabel *infoLabel;
}

@property(nonatomic,retain)Tenment *tenment;

-(IBAction)toRegisterStepRegister:(id)sender;


@end

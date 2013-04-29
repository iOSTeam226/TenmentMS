//
//  RegisterViewController.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-18.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "TMService.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize address;
@synthesize tenment;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [infoLabel1 release];
    [infoLabel2 release];
    [infoLabel3 release];
    [accountTextField release];
    [pwdTextField release];
    [surePwdTextField release];
    [nameTextField release];
    [exitBtn release];
    [registerBtn release];
    [address release];
    [tenment release];
    [super dealloc];
}

#pragma mark - UIViewController lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self backgroundImage:nil];
    [accountTextField setPlaceholder:NSLocalizedString(@"account_placeholder", nil)];
    [pwdTextField setPlaceholder:NSLocalizedString(@"pwd_placeholder", nil)];
    [surePwdTextField setPlaceholder:NSLocalizedString(@"surepwd_placeholder", nil)];
    [registerBtn setTitle:NSLocalizedString(@"register", nil) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton actions

-(IBAction)exitRegister:(id)sender{
    DDMenuController *menuController = (DDMenuController*)((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController;
    [menuController showRightController:YES];
}

-(IBAction)gotoRegister:(id)sender{
    if (0==[accountTextField.text length]) {
        [self showAlertViewWithMessage:[NSString stringWithFormat:@"%@%@",NSLocalizedString(@"account_placeholder", nil),NSLocalizedString(@"register_alert", nil)]];
    }else if(0==[nameTextField.text length]){
        [self showAlertViewWithMessage:[NSString stringWithFormat:@"姓名%@",NSLocalizedString(@"register_alert", nil)]];
    }else if(0==[pwdTextField.text length]){
        [self showAlertViewWithMessage:[NSString stringWithFormat:@"%@%@",NSLocalizedString(@"pwd_placeholder", nil),NSLocalizedString(@"register_alert", nil)]];
    }else if(0==[surePwdTextField.text length]){
        [self showAlertViewWithMessage:[NSString stringWithFormat:@"%@%@",NSLocalizedString(@"surepwd_placeholder", nil),NSLocalizedString(@"register_alert", nil)]];
    }else if(![pwdTextField.text isEqualToString:surePwdTextField.text]){
        [self showAlertViewWithMessage:NSLocalizedString(@"twoPwd_alert", nil)];
    }else{
        [self showMBProgressHUDWithView:self.view title:NSLocalizedString(@"register_loading", nil)];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [TMService registerWithAccount:accountTextField.text name:nameTextField.text pwd:pwdTextField.text address:self.address temmentId:self.tenment.tenmentId];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self removeMBProgressHUD];
            });
        });
    }
}

@end

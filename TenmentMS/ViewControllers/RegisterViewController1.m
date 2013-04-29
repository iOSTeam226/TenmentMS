//
//  RegisterViewController1.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-16.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "RegisterViewController1.h"
#import "RegisterControllerStep2.h"

@interface RegisterViewController1 ()

@end

@implementation RegisterViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [continueBtn release];
    [super dealloc];
}


#pragma mark - UIViewController lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self backgroundImage:nil];
    self.title=NSLocalizedString(@"register_step1_title", nil);
    [continueBtn setTitle:NSLocalizedString(@"continue", nil) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIButton actions

-(IBAction)toRegisterStepTwo:(id)sender{
    RegisterControllerStep2 *step2Controller=[[RegisterControllerStep2 alloc]initWithNibName:@"RegisterControllerStep2" bundle:nil];
    [self.navigationController pushViewController:step2Controller animated:YES];
    [step2Controller release];
    
}

@end

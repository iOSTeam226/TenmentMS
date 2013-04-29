//
//  RegisterControllerStep4.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "RegisterControllerStep4.h"
#import "RegisterViewController.h"

@interface RegisterControllerStep4 ()

@end

@implementation RegisterControllerStep4
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
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [tenment release];
    [continueBtn release];
    [tenmentNameLabel release];
    [provinceNameBtn release];
    [provinceBtn release];
    [cityNameBtn release];
    [cityBtn release];
    [townNameBtn release];
    [townBtn release];
    [addressTextField release];
    [addreddBtn release];
    [infoLabel release];
    [super dealloc];
}

#pragma mark - UIViewController lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self backgroundImage:nil];
    [continueBtn setTitle:NSLocalizedString(@"continue", nil) forState:UIControlStateNormal];
    [continueBtn setEnabled:NO];
    [tenmentNameLabel setText:[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"suoshu", nil),self.tenment.name]];
    NSArray *adds=[self.tenment.address componentsSeparatedByString:@"@"];
    NSString *tempProvince=[adds objectAtIndex:0];
    NSString *province=[tempProvince substringWithRange:NSMakeRange(0, tempProvince.length-1)];
    NSString *tempCity=[adds objectAtIndex:1];
    NSString *city=[tempCity substringWithRange:NSMakeRange(0, tempCity.length-1)];
    NSString *tempTown=[adds objectAtIndex:2];
    NSString *town=[tempTown substringWithRange:NSMakeRange(0, tempTown.length-1)];
    
    if ([province isEqualToString:@"台灣"]||[province isEqualToString:@"台湾"]) {
        [provinceBtn setTitle:NSLocalizedString(@"city", nil) forState:UIControlStateNormal];
        [provinceNameBtn setTitle:city forState:UIControlStateNormal];
        [cityBtn setTitle:NSLocalizedString(@"town", nil) forState:UIControlStateNormal];
        [cityNameBtn setTitle:town forState:UIControlStateNormal];
        [townBtn setHidden:YES];
        [townNameBtn setHidden:YES];
        [addreddBtn setTitle:NSLocalizedString(@"address", nil) forState:UIControlStateNormal];
        float y=147;
        infoLabel.frame=CGRectMake(0, y+2, 44, 21);
        addressTextField.frame=CGRectMake(35, y, 223, 27);
        addreddBtn.frame=CGRectMake(261, y, 54, 28);
        
    }else{
        [provinceBtn setTitle:@"省" forState:UIControlStateNormal];
        [provinceNameBtn setTitle:province forState:UIControlStateNormal];
        [cityBtn setTitle:NSLocalizedString(@"city", nil) forState:UIControlStateNormal];
        [cityNameBtn setTitle:city forState:UIControlStateNormal];
        [townBtn setTitle:NSLocalizedString(@"town", nil) forState:UIControlStateNormal];
        [townNameBtn setTitle:town forState:UIControlStateNormal];
        [addreddBtn setTitle:NSLocalizedString(@"address", nil) forState:UIControlStateNormal];
    }
    
    [addressTextField setDelegate:self];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldTextChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton actions

-(IBAction)toRegisterStepRegister:(id)sender{
    RegisterViewController *registerViewController=[[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    registerViewController.tenment=self.tenment;
    registerViewController.address=[NSString stringWithFormat:@"%@@%@",self.tenment.address,addressTextField.text];
    [self.navigationController pushViewController:registerViewController animated:YES];
    [registerViewController release];
}

#pragma mark - NSNotification method

-(void)textFieldTextChanged:(NSNotification *)notification{
    int lenght=addressTextField.text.length;
    if (0==lenght) {
        [continueBtn setEnabled:NO];
    }else{
        [continueBtn setEnabled:YES];
    }
}


@end

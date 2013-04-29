//
//  RegisterControllerStep2.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "RegisterControllerStep2.h"
#import "CheckBox.h"
#import "RegisterControllerStep3.h"
#import "UIViewController+Utilities.h"


@interface RegisterControllerStep2 ()

@end

@implementation RegisterControllerStep2

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
    [continueBtn setTitle:NSLocalizedString(@"continue", nil) forState:UIControlStateNormal];
    self.title=NSLocalizedString(@"register_step2_title", nil);
    NSArray *titleArray=[NSArray arrayWithObjects:NSLocalizedString(@"info1", nil), NSLocalizedString(@"info2", nil),NSLocalizedString(@"info3", nil),NSLocalizedString(@"info4", nil),nil];
    for (int i=0; i<[titleArray count]; i++) {
        CheckBox *checkBox=[[[NSBundle mainBundle]loadNibNamed:@"CheckBox" owner:self options:nil] lastObject];
        CGRect frame=checkBox.frame;
        frame.origin.x=25;
        frame.origin.y=60+i*frame.size.height;
        [checkBox setFrame:frame];
        [checkBox.titleLabel setText:[titleArray objectAtIndex:i]];
        checkBox.backgroundColor=[UIColor clearColor];
        [checkBox setTag:i];
        [self.view addSubview:checkBox];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton actions

-(IBAction)toRegisterStepThree:(id)sender{
    [self showMBProgressHUDWithView:self.view title:nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       NSArray *tenments=[TMService tmsList];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self removeMBProgressHUD];
            if (0<[tenments count]) {
                RegisterControllerStep3 *step3=[[RegisterControllerStep3 alloc]initWithNibName:@"RegisterControllerStep3" bundle:nil];
                step3.tenmentArray=tenments;
                [self.navigationController pushViewController:step3 animated:YES];
                [step3 release];
            }
        });
        
    });
    
    
}

@end

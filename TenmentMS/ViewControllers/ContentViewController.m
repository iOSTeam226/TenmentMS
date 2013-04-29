//
//  ContentViewController.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-16.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "ContentViewController.h"
#import "AppDelegate.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - UIViewController lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView* footImageView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_bg.png"]];
    [footImageView setFrame:CGRectMake(0, viewHeight(self)-49, 320, 49)];
    [self.view insertSubview:footImageView atIndex:0];
    [footImageView release];
    DDMenuController *menuController = (DDMenuController*)((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController;
    [menuController showRightController:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

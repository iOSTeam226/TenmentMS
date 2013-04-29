//
//  MemberViewController.m
//  ;
//
//  Created by Xiaohui Guo on 13-4-16.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "MemberViewController.h"
#import "MemberCell.h"
#import "RegisterViewController1.h"
#import "AppDelegate.h"
#import "UINavigationBar+Utilities.h"

@interface MemberViewController ()

@end

@implementation MemberViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    [memberInfoArray release];
    [super dealloc];
}

#pragma mark - UIViewController lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.frame=CGRectMake(0, 0, 280, viewHeight(nil));
    memberInfoArray=[[NSArray alloc]initWithObjects:NSLocalizedString(@"row0", nil),NSLocalizedString(@"row1", nil), NSLocalizedString(@"row2", nil),NSLocalizedString(@"row3", nil), NSLocalizedString(@"row4", nil),NSLocalizedString(@"row5", nil),nil];
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
    
    
    UIImageView *tbBgImageView=[[UIImageView alloc]initWithFrame:tableView.bounds];
    [tbBgImageView setImage:[UIImage imageNamed:@"view_bg.png"]];
    [tableView setBackgroundView:tbBgImageView];
    [tbBgImageView release];
    
    
    UIImageView *memberView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 190, 50)];
    [memberView setUserInteractionEnabled:YES];
    [memberView setImage:[UIImage imageNamed:@"header_bg.png"]];
    [tableView setTableHeaderView:memberView];
    [memberView release];
    
    UIImageView *memberIconImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15,10, 34, 31)];
    [memberIconImageView setUserInteractionEnabled:YES];
    [memberIconImageView setImage:[UIImage imageNamed:@"member_icon.png"]];
    [memberView addSubview:memberIconImageView];
    [memberIconImageView release];
    
    
    UIButton *registerButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [registerButton setTitle:NSLocalizedString(@"register", nil) forState:UIControlStateNormal];
    [registerButton setFrame:CGRectMake(60, 15, 50, 25)];
    [registerButton addTarget:self action:@selector(gotoRegister) forControlEvents:UIControlEventTouchUpInside];
    [memberView addSubview:registerButton];
    
    UIButton *loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setBackgroundImage:[UIImage imageNamed:@"btn_bg.png"] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [loginButton setTitle:NSLocalizedString(@"login", nil) forState:UIControlStateNormal];
    [loginButton setFrame:CGRectMake(120, 15, 50, 25)];
    [memberView addSubview:loginButton];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView DataSource method


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [memberInfoArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier=@"cell";
    MemberCell *cell=(MemberCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil==cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MemberCell" owner:self options:nil]lastObject];
        UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
        cell.backgroundView=imageView;
        [imageView release];
    }
    int row=indexPath.row;
    [cell.iconImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"row%d",row]]];
    [cell.titleLabel setText:[memberInfoArray objectAtIndex:row]];
    if (0==row||5==row) {
        [cell.numberButton setHidden:YES];
    }
    return cell;
    
}

#pragma mark - UITableView Delegate method

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIButton actions

-(void)gotoRegister{
    DDMenuController *menuController = (DDMenuController*)((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController;
    RegisterViewController1 *viewController = [[RegisterViewController1 alloc]init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [viewController release];
    navController.navigationBarHidden=YES;
    [menuController setRootController:navController animated:YES];
    //[navController release];
}

@end

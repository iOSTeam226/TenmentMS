//
//  RegisterControllerStep3.m
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "RegisterControllerStep3.h"
#import "MKMapView+ZoomLevel.h"
#import "CustomAnnotation.h"
#import "RegisterControllerStep4.h"

@interface RegisterControllerStep3 ()
-(NSString *)addressWithTenment:(Tenment *)tenment;
@end

@implementation RegisterControllerStep3
@synthesize tenmentArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc{
    locationManager=nil;
    [locationManager release];
    [infoLabel release];
    [tenmentArray release];
    [selectTenment release];
    [super dealloc];
}
#pragma mark - UIViewController lifecyle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self backgroundImage:nil];
    [infoLabel setText:NSLocalizedString(@"map_title", nil)];
    if (nil==locationManager) {
        locationManager=[[CLLocationManager alloc]init];
        [locationManager setDelegate:self];
        [locationManager startUpdatingLocation];
    }
    [mkMapView setShowsUserLocation:YES];
    [mkMapView setMapType:MKMapTypeStandard];
    [mkMapView setDelegate:self];
    CGRect frame=mkMapView.frame;
    frame.size.height=viewHeight(self)-49-190;
    mkMapView.frame=frame;

    for (int i=0; i<[self.tenmentArray count]; i++) {
        Tenment *tenment=[self.tenmentArray objectAtIndex:i];
        CustomAnnotation *customAnnotation=[[CustomAnnotation alloc]initWithCoordinate:CLLocationCoordinate2DMake(tenment.latitude, tenment.longitude)];
        customAnnotation.title=tenment.name;
        customAnnotation.subtitle=[self addressWithTenment:tenment];
        [mkMapView addAnnotation:customAnnotation];
        [customAnnotation release];
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManager Delegate method

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    CLLocationCoordinate2D currentCoor=[newLocation coordinate];
    if (currentCoor.latitude&&currentCoor.longitude) {
        [mkMapView setCenterCoordinate:currentCoor zoomLevel:13 animated:YES];
        [manager stopUpdatingLocation];
    }
}


//iOS 6.0
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location=[locations lastObject];
    CLLocationCoordinate2D currentCoor=[location coordinate];
    if (currentCoor.latitude&&currentCoor.longitude) {
        [mkMapView setCenterCoordinate:currentCoor zoomLevel:13 animated:YES];
        [manager stopUpdatingLocation];
    }
    
}

#pragma mark - MKMapView Delegate method

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if (![annotation isKindOfClass:[MKUserLocation class]]) {
        static NSString *anIdentifier=@"Tenment";
        MKPinAnnotationView *pinView=(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:anIdentifier];
        CustomAnnotation *an=(CustomAnnotation *)annotation;
        if (nil==pinView) {
            pinView=[[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:anIdentifier]autorelease];
            UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightBtn setTag:an.tag];
            [rightBtn addTarget:self action:@selector(selectThisTenment:) forControlEvents:UIControlEventTouchUpInside];
            [pinView setRightCalloutAccessoryView:rightBtn];
        }
        [pinView setCanShowCallout:YES];
        return pinView;
    }
    return nil;
    
}


#pragma mark - UIButton actions

-(void)selectThisTenment:(id)sender{
    UIButton *button=(UIButton *)sender;
    int tag=[button tag];
    Tenment *tenment=[self.tenmentArray objectAtIndex:tag];
    selectTenment=tenment;
    
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:NSLocalizedString(@"map_alert_title", nil) message:[NSString stringWithFormat:@"%@\n%@",[self addressWithTenment:tenment],tenment.name] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:NSLocalizedString(@"sure", nil), nil];
    [alertView show];
    [alertView release];
}


#pragma mark -UIAlertView Delegate method
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (1==buttonIndex) {
        RegisterControllerStep4 *step4=[[RegisterControllerStep4 alloc]initWithNibName:@"RegisterControllerStep4" bundle:nil];
        step4.tenment=selectTenment;
        [self.navigationController pushViewController:step4 animated:YES];
        [step4 release];
    }
}



#pragma mark - Private method

-(NSString *)addressWithTenment:(Tenment *)tenment{
    NSString *subTitle=[tenment.address stringByReplacingOccurrencesOfString:@"台灣省@" withString:@""];
    NSString *address=[subTitle stringByReplacingOccurrencesOfString:@"@" withString:@""];
    return address;
}

@end

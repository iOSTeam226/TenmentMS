//
//  RegisterControllerStep3.h
//  TenmentMS
//
//  Created by Xiaohui Guo on 13-4-17.
//  Copyright (c) 2013年 PERSONAL OUT_SOFTWARE TECHNOLOGY CO.LTD. All rights reserved.
//

#import "BaseViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Tenment.h"

@interface RegisterControllerStep3 : BaseViewController<CLLocationManagerDelegate,MKMapViewDelegate>{
    IBOutlet UILabel *infoLabel;//提示
    IBOutlet MKMapView *mkMapView;
    CLLocationManager *locationManager;
    Tenment *selectTenment;
    
}

@property(nonatomic,retain)NSArray *tenmentArray;
@end

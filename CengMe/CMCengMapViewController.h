//
//  CMCeng.h
//  CengMe
//
//  Created by Will Lee on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WeiBo.h"

@interface CMCengMapViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate,WBRequestDelegate>{
    MKMapView *_mapView;
    UIButton *_backButton;
    WeiBo *_weibo;
}

- (void)back;

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) UIButton *backButton;
@property (nonatomic, retain) WeiBo *weibo;
@end

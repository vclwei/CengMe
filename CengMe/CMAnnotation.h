//
//  CMAnnotation.h
//  CengMe
//
//  Created by Will Lee on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface CMAnnotation : NSObject <MKAnnotation>{
    CLLocationCoordinate2D _cmCoordinate;
    NSString *_cmTitle;
    NSString *_cmSubTitle;
    NSDictionary *_tweetDic;
}

- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle locaction:(CLLocationCoordinate2D)location;
+ (id)annotationWithTweetDictionary:(NSDictionary *)tweet;

@property (nonatomic, assign) CLLocationCoordinate2D cmCoordinate;
@property (nonatomic, copy) NSString *cmTitle;
@property (nonatomic, copy) NSString *cmSubTitle;
@property (nonatomic, retain) NSDictionary *tweetDic;

@end

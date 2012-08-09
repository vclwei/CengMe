//
//  CMAnnotation.m
//  CengMe
//
//  Created by Will Lee on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CMAnnotation.h"

@implementation CMAnnotation 
@synthesize cmCoordinate = _cmCoordinate;
@synthesize cmTitle = _cmTitle;
@synthesize cmSubTitle = _cmSubTitle;
@synthesize tweetDic = _tweetDic;

- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle locaction:(CLLocationCoordinate2D)location{
    self = [super init];
    if (self) {
        self.cmTitle = title;
        self.cmSubTitle = subTitle;
        self.cmCoordinate = location;
    }
    
    return self;
}

+ (id)annotationWithTweetDictionary:(NSDictionary *)tweet{
    if (tweet == nil) {
        return nil;
    }

    NSDictionary *geo = [tweet objectForKey:@"geo"];
    
    if (![geo isEqual:[NSNull null]]) {
        NSArray *geoLocation = [geo objectForKey:@"coordinates"];
        NSLog(@"%@ ", geoLocation);
        
        NSDictionary *user = [tweet objectForKey:@"user"];
        NSString *name = [user objectForKey:@"name"];
        NSString *desc = [user objectForKey:@"description"];
        
        
        NSNumber *latitudeStr = [geoLocation objectAtIndex:0];
        NSNumber *longitudeStr = [geoLocation objectAtIndex:1];
        
        CLLocationDegrees latitude = [latitudeStr doubleValue];
        CLLocationDegrees longitude = [longitudeStr doubleValue];
        CLLocationCoordinate2D loaction = CLLocationCoordinate2DMake(latitude, longitude);
        CMAnnotation *annotaion = [[[CMAnnotation alloc] initWithTitle:[NSString stringWithFormat:@"@%@",name] 
                                                             subTitle:desc
                                                            locaction:loaction] autorelease];
        annotaion.tweetDic = tweet;
        return annotaion;
    }
    
    return nil;
}

- (void)dealloc{
    self.cmTitle = nil;
    self.cmSubTitle = nil;
    self.tweetDic = nil;
    [super dealloc];
}

- (CLLocationCoordinate2D)coordinate{
    return self.cmCoordinate;
}

- (NSString *)title{
    return self.cmTitle;
}

- (NSString *)subtitle{
    return self.cmSubTitle;
}
@end

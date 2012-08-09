//
//  CMCeng.m
//  CengMe
//
//  Created by Will Lee on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CMCengMapViewController.h"

#import "CMAnnotation.h"
#import "CMAppDelegate.h"
#import "JSON.h"
#import "CMCengDetailViewController.h"


@implementation CMCengMapViewController

@synthesize mapView = _mapView;
@synthesize backButton = _backButton;
@synthesize weibo = _weibo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc{
    self.mapView = nil;
    self.backButton = nil;
    self.weibo = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.showsUserLocation = YES;
    self.mapView = mapView;
    self.mapView.delegate = self;
    [mapView release];
    [self.view addSubview:self.mapView];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:@"back_button.png"];
    self.backButton.frame = CGRectMake(10, 10, buttonImage.size.width, buttonImage.size.height);
    [self.backButton setImage:buttonImage
                     forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
}

- (void)viewDidAppear:(BOOL)animated{
    WeiBo *weibo = [[WeiBo alloc] initWithAppKey:SinaWeiBoSDK_APPKey withAppSecret:SinaWeiBoSDK_APPSecret];
    self.weibo = weibo;
    [self.weibo weiboTrendsWithName:@"带位置" andDelegate:self];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)request:(WBRequest *)request didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"%@", response);
}
- (void)request:(WBRequest *)request didFailWithError:(NSError *)error{
    
}
- (void)request:(WBRequest *)request didLoadRawResponse:(NSData *)data{
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    SBJSON *json = [[SBJSON alloc] init];
    NSArray *tweets = [json objectWithString:dataStr];
    NSLog(@"tweets %@", tweets);
    NSMutableArray *annotations = [NSMutableArray arrayWithCapacity:10];
    for (NSDictionary *tweet in tweets) {
        
        CMAnnotation *annotation = [CMAnnotation annotationWithTweetDictionary:tweet];
        if (annotation) {
            [annotations addObject:annotation];
        }
    }
    
    [self.mapView addAnnotations:annotations];
    
    [json release];
    [dataStr release];
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    CMAnnotation *annotation = view.annotation;
    CMCengDetailViewController *detail = [[CMCengDetailViewController alloc] initWithTweetDic:annotation.tweetDic];
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

//
//  CMAppDelegate.m
//  CengMe
//
//  Created by Will Lee on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CMAppDelegate.h"

#import "CMLoginViewController.h"
#import "CMMainScreenViewController.h"

@implementation CMAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;
@synthesize weibo = _weibo;

- (void)dealloc
{
    [_window release];
    self.navigationController = nil;
    self.weibo = nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    WeiBo *weibo = [[WeiBo alloc] initWithAppKey:SinaWeiBoSDK_APPKey withAppSecret:SinaWeiBoSDK_APPSecret];
    self.weibo = weibo;
    [weibo release];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Override point for customization after application launch.
    UIViewController *firstViewController = nil;
    if ([self.weibo isUserLoggedin]) {
        CMMainScreenViewController *main = [[CMMainScreenViewController alloc] init];
        firstViewController = main;
    }
    else{
        CMLoginViewController *login = [[CMLoginViewController alloc] init];
        firstViewController = login;
    }
    
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:firstViewController] autorelease];
    self.navigationController.navigationBar.hidden = YES;
    [firstViewController release];
    
    [self.window addSubview:self.navigationController.view];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

//for ios version below 4.2
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	if( [self.weibo handleOpenURL:url] )
		return TRUE;
	
	return TRUE;
}

//for ios version is or above 4.2
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
	if( [self.weibo handleOpenURL:url] )
		return TRUE;
	
	return TRUE;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

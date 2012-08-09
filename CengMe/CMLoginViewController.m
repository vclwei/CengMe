//
//  CMLoginViewController.m
//  CengMe
//
//  Created by Will Lee on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CMLoginViewController.h"

#import "CMLoginView.h"
#import "CMAppDelegate.h"
#import "CMMainScreenViewController.h"

@implementation CMLoginViewController

@synthesize loginView = _loginView;
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
    self.loginView = nil;
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
    
    CMLoginView *loginView = [[CMLoginView alloc] initWithFrame:self.view.bounds];
    self.loginView = loginView;
    [loginView release];
    [self.view addSubview:self.loginView];
    
    [self.loginView.loginButton addTarget:self 
                                   action:@selector(loginAction:) 
                         forControlEvents:UIControlEventTouchUpInside];
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

- (void)loginAction:(id)sender{
    WeiBo *weibo = [[WeiBo alloc] initWithAppKey:SinaWeiBoSDK_APPKey withAppSecret:SinaWeiBoSDK_APPSecret];
    self.weibo = weibo;
    [weibo release];

	self.weibo.delegate = self;
	[self.weibo startAuthorize];
}

- (void)weiboDidLogin
{    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(goMainScreen)];
    self.loginView.loginButton.alpha = 0;
    [UIView commitAnimations];
}

- (void)weiboLoginFailed:(BOOL)userCancelled withError:(NSError*)error
{
	UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:@"用户验证失败！"  
													   message:userCancelled?@"用户取消操作":[error description]  
													  delegate:nil
											 cancelButtonTitle:@"确定" 
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)weiboDidLogout
{
	
	UIAlertView* alertView = [[UIAlertView alloc]initWithTitle:nil 
													   message:@"用户已成功退出！" 
													  delegate:nil 
											 cancelButtonTitle:@"确定" 
											 otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)goMainScreen{
    CMMainScreenViewController *mainScreen = [[CMMainScreenViewController alloc] init];
    [self.navigationController pushViewController:mainScreen animated:NO];
    [mainScreen release];
}

@end

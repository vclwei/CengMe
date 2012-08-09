//
//  CMMainScreen.m
//  CengMe
//
//  Created by Will Lee on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CMMainScreenViewController.h"

#import "CMCengMapViewController.h"

@implementation CMMainScreenViewController

@synthesize logoLabel = _logoLabel;
@synthesize settingButton = _settingButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc{
    self.logoLabel = nil;
    self.settingButton = nil;
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
    
    UILabel *logoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    logoLabel.text = @"蹭 我";
    logoLabel.textColor = [UIColor blackColor];
    logoLabel.font = [UIFont boldSystemFontOfSize:100];
    logoLabel.backgroundColor = [UIColor clearColor];
    self.logoLabel = logoLabel;
    [logoLabel release];
    CGSize logoSize = [self.logoLabel.text sizeWithFont:self.logoLabel.font];
    self.logoLabel.frame = CGRectIntegral(CGRectMake((self.view.bounds.size.width - logoSize.width)/2,
                                                (self.view.bounds.size.height - logoSize.height)/2 - 20,
                                                logoSize.width,
                                                logoSize.height));
    [self.view addSubview:self.logoLabel];
}

- (void)viewDidAppear:(BOOL)animated{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    self.logoLabel.font = [UIFont boldSystemFontOfSize:120];
//    CGSize logoSize = [self.logoLabel.text sizeWithFont:self.logoLabel.font];
//    self.logoLabel.frame = CGRectIntegral(CGRectMake((self.view.bounds.size.width - logoSize.width)/2,
//                                                     (self.view.bounds.size.height - logoSize.height)/2,
//                                                     logoSize.width,
//                                                     logoSize.height));
//    [UIView commitAnimations];
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (touch) {
        CGPoint location = [touch locationInView:self.view];
        if (location.x < self.view.bounds.size.width/2) {
            [self goCeng];
        }
        else{
            [self goMe];
        }
    }
}

- (void)goCeng{
    NSLog(@"go ceng");
    CMCengMapViewController *ceng = [[CMCengMapViewController alloc] init];
    [self.navigationController pushViewController:ceng animated:YES];
    [ceng release];
}

- (void)goMe{
    NSLog(@"go me");
}

@end

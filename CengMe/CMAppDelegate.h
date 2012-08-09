//
//  CMAppDelegate.h
//  CengMe
//
//  Created by Will Lee on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WeiBo.h"

@interface CMAppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *_navigationController;
    WeiBo *_weibo;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) WeiBo *weibo;

@end

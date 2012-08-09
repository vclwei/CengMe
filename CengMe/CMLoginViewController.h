//
//  CMLoginViewController.h
//  CengMe
//
//  Created by Will Lee on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiBo.h"

@class CMLoginView;

@interface CMLoginViewController : UIViewController <WBSessionDelegate>{
    CMLoginView *_loginView;
    WeiBo *_weibo;
}

@property (nonatomic, retain) CMLoginView *loginView;
@property (nonatomic, retain) WeiBo *weibo;

- (void)loginAction:(id)sender;
- (void)goMainScreen;
@end

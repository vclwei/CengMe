//
//  CMMainScreen.h
//  CengMe
//
//  Created by Will Lee on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMMainScreenViewController : UIViewController{
    UILabel *_logoLabel;
    UIButton *_settingButton;
}

- (void)goCeng;
- (void)goMe;

@property (nonatomic, retain) UILabel *logoLabel;
@property (nonatomic, retain) UIButton *settingButton;

@end

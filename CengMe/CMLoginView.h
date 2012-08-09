//
//  CMLoginView.h
//  CengMe
//
//  Created by Will Lee on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMLoginView : UIView{
    UILabel *_logo;
    UIButton *_loginButton;
}

@property (nonatomic, retain) UILabel *logo;
@property (nonatomic, retain) UIButton *loginButton;

@end

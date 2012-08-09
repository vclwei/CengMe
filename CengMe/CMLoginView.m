//
//  CMLoginView.m
//  CengMe
//
//  Created by Will Lee on 11/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CMLoginView.h"

@implementation CMLoginView

@synthesize logo = _logo;
@synthesize loginButton = _loginButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *logo = [[UILabel alloc] initWithFrame:CGRectZero];
        logo.text = @"蹭 我";
        logo.textColor = [UIColor blackColor];
        logo.font = [UIFont boldSystemFontOfSize:100];
        logo.backgroundColor = [UIColor clearColor];
        self.logo = logo;
        [logo release];
        [self addSubview:self.logo];
        
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginButton setImage:[UIImage imageNamed:@"weibo_login_48.png"]
                     forState:UIControlStateNormal];
        self.loginButton = loginButton;
        [self addSubview:self.loginButton];
    }
    return self;
}

- (void)dealloc{
    self.logo = nil;
    self.loginButton = nil;
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)layoutSubviews{
    CGSize logoSize = [self.logo.text sizeWithFont:self.logo.font];
    self.logo.frame = CGRectIntegral(CGRectMake((self.bounds.size.width - logoSize.width)/2,
                                 (self.bounds.size.height - logoSize.height)/2 - 20,
                                 logoSize.width,
                                 logoSize.height));
    
    CGSize buttonSize = [self.loginButton currentImage].size;
    self.loginButton.frame = CGRectIntegral(CGRectMake((self.bounds.size.width - buttonSize.width)/2,
                                        CGRectGetMaxY(self.logo.frame) + 20,
                                        buttonSize.width,
                                        buttonSize.height));
}

@end

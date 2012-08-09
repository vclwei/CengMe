//
//  CMCengDetailViewController.h
//  CengMe
//
//  Created by Will Lee on 11/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMCengDetailViewController : UIViewController{
    NSDictionary *_tweetDic;
    UIButton *_backButton;
    UIButton *_cengButton;
}

- (id)initWithTweetDic:(NSDictionary *)tweet;

@property (nonatomic, retain) NSDictionary *tweetDic;
@property (nonatomic, retain) UIButton *backButton;
@property (nonatomic, retain) UIButton *cengButton;

@end

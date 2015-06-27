//
//  led_jishu.h
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface led_jishu : UIView
@property(nonatomic)CAGradientLayer * gradientlayer;
@property(nonatomic)CAGradientLayer * gradientlayer2;
@property(nonatomic)CAShapeLayer *shapelayer;
@property(nonatomic)NSArray * arrayColor;
@property(nonatomic)NSArray * arrayColor2;
@property(nonatomic)UILabel * label,*label2;
@property(nonatomic)UIFont * font1,*font2;
@property(nonatomic)float z;
@end

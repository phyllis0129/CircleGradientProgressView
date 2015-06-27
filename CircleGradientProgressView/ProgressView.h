//
//  ProgressView.h
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property(nonatomic)CGPoint point;

@property(nonatomic)float radius;

@property(nonatomic)float lineWidth;


@property(nonatomic)CGRect rect1,rect2;

@property(nonatomic)float progress;

@property(nonatomic)CAGradientLayer * gradientlayer1,*gradientlayer2;

@property(nonatomic)CALayer * layer_d;

@property(nonatomic)CAShapeLayer * shapelayer;

@property(nonatomic)NSArray * array1,*array2;

@property(nonatomic)UIBezierPath * apath;

@property(nonatomic)CABasicAnimation *animation;
@end


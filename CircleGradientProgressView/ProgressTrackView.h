//
//  ProgressTrackView.h
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressTrackView : UIView
@property(nonatomic)CAShapeLayer * shapelayer;

@property(nonatomic)CGPoint point;

@property(nonatomic)float rdius;

@property(nonatomic)float lineWidth;

@property(nonatomic)UIColor *lineColor;

@property(nonatomic)BOOL isNeedShadow;
@end

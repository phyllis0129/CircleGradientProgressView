//
//  CircleGradientProgressView.h
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressTrackView.h"
#import "ProgressView.h"
#import "led_jishu.h"
@interface CircleGradientProgressView : UIView

@property(nonatomic)float progressLineWidth;

@property(nonatomic)float trackLineWidth;

@property(nonatomic)UIColor *trackLineColor;

@property(nonatomic)float progress;

@property(nonatomic)ProgressTrackView * trackView;

@property(nonatomic)ProgressView * progressView;

@property(nonatomic)led_jishu*led_jishu;


-(id)initWithFrame:(CGRect)frame trackAbove:(BOOL)above trackShadow:(BOOL)shadow;

@end


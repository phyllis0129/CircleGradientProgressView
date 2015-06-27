//
//  CircleGradientProgressView.m
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import "CircleGradientProgressView.h"
#import "ProgressTrackView.h"
#import "ProgressView.h"
@implementation CircleGradientProgressView
//托空间初始化
-(void)awakeFromNib{
    [self initViewWithTrackAbove:YES trackShadow:NO];
}

//代码创建初始化
-(id)initWithFrame:(CGRect)frame trackAbove:(BOOL)above trackShadow:(BOOL)shadow{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViewWithTrackAbove:above trackShadow:shadow];
    }
    return  self;
}

-(void)initViewWithTrackAbove:(BOOL)above trackShadow:(BOOL)shadow{
    _progressLineWidth = _trackLineWidth = 20;
    _trackLineColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
    _trackView = [[ProgressTrackView alloc]init];
    _trackView.backgroundColor = [UIColor clearColor];
    _trackView.isNeedShadow = shadow;
    _progressView = [[ProgressView alloc]init];
    _progressView.backgroundColor = [UIColor clearColor];
    _led_jishu = [[led_jishu alloc ]init];
    _led_jishu.backgroundColor = [UIColor clearColor];
    if (above) {
        [self insertSubview:_progressView atIndex:1];
        [self insertSubview:_trackView atIndex:2];
    }else{
        [self insertSubview:_trackView atIndex:1];
        [self insertSubview:_progressView atIndex:2];
    }
}


//重绘方法
-(void)drawRect:(CGRect)rect{
    
    [self draw_scdcdt:rect];
    [self draw_jishu:rect];
    
}

//添加计数器
-(void)draw_jishu:(CGRect)rect{
    if(rect.size.width>rect.size.height){
        _led_jishu.frame = CGRectMake(0, 0, 2*rect.size.height/3, rect.size.height/3);
    }else {
        _led_jishu.frame = CGRectMake(0, 0, 2*rect.size.width/3, rect.size.width/3);
    }
    
    _led_jishu.layer.position = CGPointMake(rect.size.width/2, rect.size.height/2);
    _led_jishu.z = _progress*50;
    [self insertSubview:_led_jishu atIndex:0];
    
}

//添加上层,中间层，底层
-(void)draw_scdcdt:(CGRect)rect{
    _trackView.frame = CGRectMake(rect.origin.x + (_progressLineWidth - _trackLineWidth) / 2, rect.origin.y + (_progressLineWidth - _trackLineWidth) / 2, rect.size.width - _progressLineWidth + _trackLineWidth, rect.size.height - _progressLineWidth + _trackLineWidth);
    _progressView.frame = rect;
    //宽度，值，宽度
    _trackView.lineWidth = _trackLineWidth;
    _trackView.lineColor = _trackLineColor;
    _progressView.progress = _progress;
    _progressView.lineWidth = _progressLineWidth;
}

-(void)setProgressLineWidth:(float)lineWidth{
    _progressLineWidth = lineWidth > 20 ? 20 : lineWidth;
    [self setNeedsDisplay];
}

- (void)setTrackLineWidth:(float)trackLineWidth{
    _trackLineWidth = trackLineWidth > 20 ? 20 : trackLineWidth;
    [self setNeedsDisplay];
}

- (void)setTrackLineColor:(UIColor *)trackLineColor{
    _trackLineColor = trackLineColor;
    [self setNeedsDisplay];
}

-(void)setProgress:(float)progress{
    _progress = progress;
    [self setNeedsDisplay];
}
@end


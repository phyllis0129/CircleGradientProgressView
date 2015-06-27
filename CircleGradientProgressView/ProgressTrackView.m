//
//  ProgressTrackView.m
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import "ProgressTrackView.h"

@implementation ProgressTrackView

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initShapeLayer];
    }
    return self;
}

-(void)initShapeLayer{
    _shapelayer = [CAShapeLayer layer];
    _shapelayer.fillColor = [[UIColor clearColor]CGColor];
    _shapelayer.strokeColor = [[UIColor whiteColor] CGColor];
    _shapelayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapelayer.lineJoin = kCALineJoinRound;
    _shapelayer.lineCap = kCALineCapRound;
    _shapelayer.frame = CGRectMake(0, 0, 0, 0);
}

-(void)setcanshu:(CGRect)rect{
    _rdius = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-_lineWidth/2;
    _point = CGPointMake(rect.size.width/2, rect.size.height/2);
    if(_shapelayer.frame.origin.x==0||
       _shapelayer.frame.origin.y==0||
       _shapelayer.frame.size.width==0||
       _shapelayer.frame.size.height==0){
        
        _shapelayer.frame = rect;
        _shapelayer.lineWidth = _lineWidth;
        UIBezierPath * apath = [UIBezierPath bezierPath];
        [apath addArcWithCenter:_point radius:_rdius startAngle:0 endAngle:2*M_PI clockwise:YES];
        _shapelayer.path = apath.CGPath;
        _shapelayer.strokeEnd = 1;
    }
}

-(void)drawRect:(CGRect)rect{
    [self setcanshu:rect];
    [self draw_jby];
    [self draw_mb];
}

-(void)draw_mb{
    [self.layer setMask:_shapelayer];
}
-(void)draw_jby{
    UIColor *middleColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    NSArray *colors = [NSArray new];
    if (_isNeedShadow) {
        colors = [NSArray arrayWithObjects:
                  (id)_lineColor.CGColor,(id)middleColor.CGColor, (id)_lineColor.CGColor, nil];
    }else{
        colors = [NSArray arrayWithObjects:
                  (id)_lineColor.CGColor, (id)_lineColor.CGColor, nil];
    }
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, NULL);
    
    CGPoint start = _point;  //开始的点
    CGPoint end = _point; //结束的点
    CGFloat startRadius = _rdius+_lineWidth/2;      //半径
    CGFloat endRadius = _rdius-_lineWidth/2;          //空心半径
    CGContextRef graCtx = UIGraphicsGetCurrentContext();
    CGContextDrawRadialGradient(graCtx, gradient, start, startRadius, end, endRadius, 0);
}
-(void)setLineWidth:(float)sc_kd{
    _lineWidth = sc_kd;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}
@end

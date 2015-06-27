//
//  ProgressView.m
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import "ProgressView.h"
#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]
@implementation ProgressView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLayer];
    }
    return self;
}
-(void)initLayer{
    _lineWidth = 20;
    _gradientlayer1 = [CAGradientLayer layer];
    //    _gradientlayer2 = [CAGradientLayer layer];
    
    //渐变范围
    _gradientlayer1.startPoint = CGPointMake(0.0, 0.0);
    _gradientlayer1.endPoint = CGPointMake(1.0, 1.0);
    _gradientlayer1.locations = @[@(0.25),@(0.75)];
    //    _gradientlayer2.startPoint = CGPointMake(0.0, 1.0);
    //    _gradientlayer2.endPoint = CGPointMake(0.0, 0.0);
    
    //    _gradientlayer2.locations = @[@(0.25),@(0.75)];
    
    _array1 = [NSArray arrayWithObjects:(id)[RGBACOLOR(245, 74, 129, 1.0) CGColor],(id)[RGBACOLOR(105, 152, 241, 1.0) CGColor], nil];
    //    _array2 = [NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[[UIColor blueColor] CGColor], nil];
    
    //渐变开始
    _gradientlayer1.colors = _array1;
    //    _gradientlayer2.colors = _array1;
    
    //将渐变层合并一个层，方便控制
    _layer_d = [CALayer layer];
    [_layer_d insertSublayer:_gradientlayer1 atIndex:0];
    //    [_layer_d insertSublayer:_gradientlayer2 atIndex:0];
    
    
    //设置蒙板
    _shapelayer = [CAShapeLayer layer];
    
    _shapelayer.fillColor = [[UIColor clearColor]CGColor];
    _shapelayer.strokeColor = [[UIColor redColor] CGColor];
    _shapelayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapelayer.lineJoin = kCALineJoinRound;
    _shapelayer.lineCap = kCALineCapRound;
    _shapelayer.frame = CGRectMake(0, 0, 0, 0);
}
-(void)setcanshu:(CGRect)rect{
    _radius = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-_lineWidth/2;
    _point = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    _rect1 = CGRectMake(rect.size.width/2-_radius-_lineWidth/2, rect.size.height/2-_radius-_lineWidth/2, _radius+_lineWidth/2, 2*_radius+_lineWidth);
    _rect2 = CGRectMake(rect.size.width/2,rect.size.height/2-_radius-_lineWidth/2,_radius+_lineWidth/2, 2*_radius+_lineWidth);
    
    _gradientlayer1.frame = rect;
    //    _gradientlayer2.frame = _rect2;
    
    _layer_d.frame = rect;
    
    if(_shapelayer.frame.origin.x==0||
       _shapelayer.frame.origin.y==0||
       _shapelayer.frame.size.width==0||
       _shapelayer.frame.size.height==0){
        _shapelayer.frame = rect;
        //旋转角度
        _shapelayer.transform = CATransform3DMakeRotation(-M_PI / 2, 0, 0, 1);
    }
    
    _shapelayer.lineWidth = _lineWidth;
    _apath = [UIBezierPath bezierPath];
    
    [_apath addArcWithCenter:_point radius:_radius-2 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    _shapelayer.path = _apath.CGPath;
    //    if(_z>_z1){
    //        _z1 = 0.001+_z>0.999?1:0.001+_z;
    //    }else {
    //        _z1 = 0.001+_z<0?0.001:0.001+_z;
    //    }
    _shapelayer.strokeEnd = _progress;
    
    [_layer_d setMask:_shapelayer];
    [self.layer addSublayer:_layer_d];
    
}


-(void)drawRect:(CGRect)rect{
    [self setcanshu:rect];
    //    [self draw_yy];
    
}
//设置阴影
-(void)draw_yy{
    //y阴影
    self.layer.shadowOffset = CGSizeMake(5, 5); //设置阴影的偏移量
    self.layer.shadowRadius = 5.0;  //设置阴影的半径
    self.layer.shadowColor = [UIColor blackColor].CGColor; //设置阴影的颜色为黑色
    self.layer.shadowOpacity = 1; //透明度
}
-(void)setLineWidth:(float)lineWidth{
    _lineWidth = lineWidth;
    [self startAnimation];
}

- (void)startAnimation{
    _animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    [_animation setFromValue:[NSNumber numberWithFloat:0.0]];
    [_animation setToValue:[NSNumber numberWithFloat:_progress]];
    [_animation setDuration:5.0];
    [_animation setRemovedOnCompletion:YES];
    [_animation setFillMode:kCAFillModeForwards];
    [_animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [_animation setDelegate:self];
    
    [_shapelayer addAnimation:_animation forKey:@"animationStrokeEnd"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([[(CABasicAnimation*)anim keyPath] isEqualToString:@"strokeEnd"] && flag) {
        [self setNeedsDisplay];
    }
}
@end


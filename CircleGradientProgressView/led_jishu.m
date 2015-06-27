//
//  led_jishu.m
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import "led_jishu.h"

@implementation led_jishu

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self csh] ;
    return  self;
}
-(void)awakeFromNib{
    [self csh];
}
-(void)csh{
    _gradientlayer = [CAGradientLayer layer];
    _arrayColor = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:1 green:0.50196 blue:0 alpha:1]CGColor],(id)[[UIColor whiteColor]CGColor ],nil];
    _gradientlayer.colors = _arrayColor;
    _gradientlayer.startPoint = CGPointMake(0, 0);
    _gradientlayer.endPoint = CGPointMake(0,1.5);
    
    _gradientlayer.cornerRadius = 7.0;
    
    _gradientlayer2 = [CAGradientLayer layer];
    _arrayColor2 = [NSArray arrayWithObjects:(id)[[UIColor clearColor]CGColor],(id)[[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]CGColor ],[[UIColor clearColor] CGColor],nil];
    _gradientlayer2.colors = _arrayColor2;
    _gradientlayer2.startPoint = CGPointMake(0, 0);
    _gradientlayer2.endPoint = CGPointMake(0.7,0.5);
    
    _gradientlayer2.cornerRadius = 7.0;
    
    _label = [[UILabel alloc]init];
    _label.textAlignment = 1;
    _label.textColor = [UIColor blackColor];
    
    
    _label2 = [[UILabel alloc]init];
    _label2.textAlignment = 1;
    _label2.textColor = [UIColor redColor];
    
    
    
    [self.layer addSublayer:_gradientlayer];
    [self.layer addSublayer:_gradientlayer2];
    [self insertSubview:_label atIndex:1];
    [self insertSubview:_label2 atIndex:1];
}
-(void)cshcs:(CGRect)rect{
    
    _gradientlayer.frame = rect;
    _gradientlayer2.frame = rect;
    
    _label.frame = rect;
    _font1 = [UIFont fontWithName:@"DBLCDTempBlack" size:rect.size.height/2];
    _label.font = _font1;
    _label.text = [NSString stringWithFormat:@"%.2f",_z];
    
    _label2.frame = CGRectMake(4*rect.size.width/5, 0, rect.size.width/5, rect.size.height/3);
    _font2 = [UIFont fontWithName:@"DBLCDTempBlack" size:rect.size.height/4];
    _label2.font = _font2;
    _label2.text = @"℃";
    
    
}
-(void)drawRect:(CGRect)rect{
    [self cshcs:rect];
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
-(void)setZ:(float)z{
    _z = z;
    [self setNeedsDisplay];
}
@end
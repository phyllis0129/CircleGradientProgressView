//
//  ViewController.m
//  CircleGradientProgressView
//
//  Created by 李玉刚 on 6/27/15.
//  Copyright (c) 2015 yunwiiTech. All rights reserved.
//

#import "ViewController.h"
#import "CircleGradientProgressView.h"


#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _wendu = [[CircleGradientProgressView alloc]initWithFrame:self.view.bounds trackAbove:NO trackShadow:YES];
        _wendu.backgroundColor = [UIColor whiteColor];
        _wendu.trackLineColor = RGBACOLOR(161, 221, 255, 1.0);
        _wendu.trackLineWidth = 20;
        [self.view addSubview:_wendu];
        
        UIStepper * stepper = [[UIStepper alloc]initWithFrame:CGRectMake(110, self.view.bounds.size.height-100, 100, 50)];
        [stepper addTarget:self action:@selector(kaishi:) forControlEvents:UIControlEventTouchDown];
        stepper.minimumValue = 0.0f;
        stepper.maximumValue = 52.0f;
        stepper.value = 0.0f;
        stepper.stepValue = 1.0f;
        [self.view addSubview:stepper];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//改变状态
-(void)kaishi:(UIStepper*)stepper{
    _wendu.progress = 1.0;
}

@end

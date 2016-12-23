//
//  XYWaveView.m
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "XYWaveView.h"

@interface XYWaveView () {
    
    CADisplayLink *_displayLink;
}

@end

@implementation XYWaveView

@synthesize waveColor = _waveColor;

#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        if (_shapleLayer == nil) {
            _shapleLayer = [CAShapeLayer layer];
            [self.layer addSublayer:_shapleLayer];
        }
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor clearColor];
    [self.layer setMasksToBounds:YES];
    _shapleLayer.fillColor = self.waveColor.CGColor;
    
    [self start];
}


#pragma mark - 定时器
- (void)start {

    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(waveRun)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stop {

    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
}

- (void)waveRun {
    
    if (!self.superview || !self.window) {
        [self stop];
    }
    
    
}



#pragma mark - set \ get
- (void)setWaveColor:(UIColor *)waveColor {
    _waveColor = waveColor;
    _shapleLayer.fillColor = waveColor.CGColor;
}

- (CGFloat)waveHeight {
    
    return _waveHeight ?: CGRectGetHeight(self.frame) * 0.5;
}

- (CGFloat)cycle {
    
    return _cycle ?: 0.5 / 30.0;
}

- (CGFloat)amplitude {

    return _amplitude ?: 2;
}

- (UIColor *)waveColor {
    
    return _waveColor ?: [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
}

- (CGFloat)waveWidth {
    
    return CGRectGetWidth(self.frame);
}

- (CGFloat)waveSpeed {
    
    return _waveSpeed ?: 1/M_PI;
}




- (void)dealloc {

    NSLog(@"%s", __FUNCTION__);
}

@end

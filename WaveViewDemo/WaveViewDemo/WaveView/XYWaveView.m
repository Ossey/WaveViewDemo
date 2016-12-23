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
    CAShapeLayer *_shapleLayer;
}

@property (nonatomic, assign) XYWaveType type; // 波浪的类型

@end

@implementation XYWaveView

#pragma mark - 初始化方法
- (instancetype)initWithFrame:(CGRect)frame waveType:(XYWaveType)type {
    
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        [self setup];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    return [self initWithFrame:frame waveType:kNilOptions];
}

- (void)setup {
    
    self.backgroundColor = [UIColor clearColor];
    [self.layer setMasksToBounds:YES];
    [self shapleLayer].fillColor = self.waveColor.CGColor;
    
    [self start];
}


#pragma mark - 定时器
- (void)start {

    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(startWave)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)stop {

    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
}

- (void)startWave {
    
    self.offsetX += self.waveSpeed;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = self.waveHeight;
    
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (NSInteger i = 0; i <= self.waveWidth; i++) {
        
        if (self.type == XYWaveTypeSine) {
            
            // 正弦函数波浪公式
            y = self.amplitude * sin(self.cycle  * i + self.offsetX) + self.waveHeight;
        } else {
        
            // 余弦函数波浪公式
            y = self.amplitude * cos(self.cycle  * i + self.offsetX) + self.waveHeight;
        }
        
        
        CGPathAddLineToPoint(path, nil, i, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.waveWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    [self shapleLayer].path = path;
    
    CGPathRelease(path);
    
    if (!self.superview || !self.window) {
        [self stop];
    }
}

#pragma mark - set \ get
- (CGFloat)waveHeight {
    
    return _waveHeight ?: CGRectGetHeight(self.frame) * 0.5;
}

- (CGFloat)cycle {
    
    return _cycle ?: 0.5 / 30.0;
}

- (CGFloat)amplitude {
    if (self.type == XYWaveTypeCosine) {      // 余弦
        _amplitude = 13;
    } else if (self.type ==  XYWaveTypeSine) { // 正弦
        _amplitude = 12;
    } else {
        _amplitude = 2;
    }
    
    return _amplitude;
}

- (UIColor *)waveColor {
    
    return _waveColor ?: [UIColor colorWithRed:86/255.0f green:202/255.0f blue:139/255.0f alpha:1];
}

- (CGFloat)waveWidth {
    
    return CGRectGetWidth(self.frame);
}

- (CGFloat)waveSpeed {
    
    if (self.type == XYWaveTypeCosine) {      // 余弦
         _waveSpeed = 0.04;
    } else if (self.type ==  XYWaveTypeSine) { // 正弦
        _waveSpeed = 0.02;
    } else {
        _waveSpeed = 1/M_PI;
    }
    
    return _waveSpeed;
}

- (CAShapeLayer *)shapleLayer {
    
    if (_shapleLayer == nil) {
        
        _shapleLayer = [CAShapeLayer layer];
        [self.layer addSublayer:_shapleLayer];
        
    }
    return _shapleLayer;
}



- (void)dealloc {

    NSLog(@"%s", __FUNCTION__);
}

@end

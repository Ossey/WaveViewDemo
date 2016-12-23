//
//  XYWaveProgressView.m
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "XYWaveProgressView.h"

@interface XYWaveProgressView () {
    NSTimer *_timer;
}

@property (nonatomic, strong) CAShapeLayer *maskLayer;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation XYWaveProgressView

@synthesize progressTextFont = _progressTextFont;
@synthesize progressTextColor = _progressTextColor;

- (instancetype)initWithFrame:(CGRect)frame {

    CGRect tempFrame = frame;
    tempFrame.size.width = tempFrame.size.height;
    frame = tempFrame;
    
    if (self = [super initWithFrame:tempFrame]) {
        
        [self setup];
    }
    
    return self;
}

- (void)setup {

    self.backgroundColor = [UIColor colorWithRed:236/255.0f green:90/255.0f blue:66/255.0f alpha:1];
    self.amplitude = 2;
    self.waveSpeed = 2;
    self.layer.mask = self.maskLayer;
    self.progressLabel.hidden = NO;
    
    
}

- (void)waveRun {
    
    [super waveRun];
    
    self.waveHeight = MAX(0, (1 - self.progress / 100)) * CGRectGetHeight(self.frame);
    self.progressLabel.text = [NSString stringWithFormat:@"%0.0f%%", 100 * MIN(1, self.progress / 100)];
    self.offsetX += self.waveSpeed;
    
    [self setSinePath];
}

// 设置正弦path
- (void)setSinePath {
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = self.waveHeight;
    
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (float x = 0.0f; x <= self.waveWidth; x++) {
        
        // 正弦函数波浪公式
        y = self.amplitude * sin((2 * M_PI / self.waveWidth) * (x - self.offsetX)) + self.waveHeight;
        if (self.progress == 100) {
            y = 0;
            [self stop];
        }
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    
    CGPathAddLineToPoint(path, nil, self.waveWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    _shapleLayer.path = path;
    
    CGPathRelease(path);
    
}

- (void)stop {
    
    [super stop];
    
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)start {
    [super start];
    
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(progressRun) userInfo:nil repeats:YES];
    }

}

- (void)progressRun {
    self.progress++;
    
    if (self.progress == 100 && _timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

#pragma mark - set \ get
- (void)setProgressTextColor:(UIColor *)progressTextColor {
    _progressTextColor = progressTextColor;
    self.progressLabel.textColor = progressTextColor;
}

- (void)setProgressTextFont:(UIFont *)progressTextFont {
    _progressTextFont = progressTextFont;
    [self.progressLabel setFont:progressTextFont];
}

- (CAShapeLayer *)maskLayer {
    if (_maskLayer == nil) {
        _maskLayer = [CAShapeLayer layer];
        [self.layer addSublayer:_maskLayer];
        _maskLayer.fillColor = [UIColor whiteColor].CGColor;
        CGPoint center = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5);
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:self.waveWidth * 0.5 startAngle:0 endAngle:360 clockwise:YES];
        _maskLayer.path = circlePath.CGPath;
    }
    
    return _maskLayer;
}

- (UILabel *)progressLabel {
    if (_progressLabel == nil) {
        UILabel *progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        progressLabel.center = CGPointMake(CGRectGetWidth(self.frame) * 0.5, CGRectGetHeight(self.frame) * 0.5);
        progressLabel.font = self.progressTextFont;
        progressLabel.textColor = self.progressTextColor;
        progressLabel.backgroundColor = [UIColor clearColor];
        progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel = progressLabel;
        [self addSubview:progressLabel];
    }
    return _progressLabel;
}

- (UIFont *)progressTextFont {

    return _progressTextFont ?: [UIFont systemFontOfSize:30];
}

- (UIColor *)progressTextColor {

    return _progressTextColor ?: [UIColor greenColor];
}

@end

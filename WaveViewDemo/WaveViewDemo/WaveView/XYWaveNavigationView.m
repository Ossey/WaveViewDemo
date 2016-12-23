//
//  XYWaveNavigationView.m
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "XYWaveNavigationView.h"

@interface XYWaveNavigationView ()

@property (nonatomic, assign) XYWaveType type; // 波浪的类型

@end

@implementation XYWaveNavigationView

- (instancetype)initWithFrame:(CGRect)frame waveType:(XYWaveType)type {
    
    if (self = [super initWithFrame:frame]) {
        self.type = type;
    }
    
    return self;
}


// 重写父类的方法， 执行波浪效果
- (void)waveRun {
    
    [super waveRun];
    
    self.offsetX += self.waveSpeed;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat y = self.waveHeight;
    
    CGPathMoveToPoint(path, nil, 0, y);
    
    for (float x = 0.0f; x <= self.waveWidth; x++) {
        
        if (self.type == XYWaveTypeSine) {
            
            // 正弦函数波浪公式
            y = self.amplitude * sin(self.cycle  * x + self.offsetX) + self.waveHeight;
        } else {
            
            // 余弦函数波浪公式
            y = self.amplitude * cos(self.cycle  * x + self.offsetX) + self.waveHeight;
        }
        
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.waveWidth, 0);
    CGPathAddLineToPoint(path, nil, 0, 0);
    
    CGPathCloseSubpath(path);
    _shapleLayer.path = path;
    
    CGPathRelease(path);

}

- (CGFloat)amplitude {
    if (self.type == XYWaveTypeCosine) {      // 余弦
        return 13;
    } else if (self.type == XYWaveTypeSine) { // 正弦
        return 12;
    }

    return [super amplitude];
    
}

- (CGFloat)waveSpeed {
    
    if (self.type == XYWaveTypeCosine) {      // 余弦
        return 0.04;
    } else if (self.type ==  XYWaveTypeSine) { // 正弦
        return 0.02;
    }
    return  [super waveSpeed];
    
}

- (void)dealloc {

    NSLog(@"%s", __FUNCTION__);
}

@end

//
//  XYWaveView.h
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYWaveView : UIView {
@public
    CAShapeLayer *_shapleLayer;
}

@property (nonatomic, strong) UIColor *waveColor; // 波浪的颜色
@property (nonatomic, assign) CGFloat waveWidth;  // 波浪的宽度
@property (nonatomic, assign) CGFloat waveSpeed;  // 波浪流动速度  
@property (nonatomic, assign) CGFloat amplitude;  // 波浪的振幅
@property (nonatomic, assign) CGFloat cycle;      // 波浪的周期
@property (nonatomic, assign) CGFloat waveHeight; // 波浪的高度
@property (nonatomic, assign) CGFloat offsetX;    // X轴位移


- (void)start;
- (void)stop;
- (void)waveRun;  // 开始波浪的动画，所有的子类都要重写此方法, 用于执行波浪效果的代码块

@end

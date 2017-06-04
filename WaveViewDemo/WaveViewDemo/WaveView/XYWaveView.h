//
//  XYWaveView.h
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XYWaveType) {

    XYWaveTypeSine,   // 正弦波浪
    XYWaveTypeCosine  // 余弦波浪
};

@interface XYWaveView : UIView

@property (nonatomic, strong) UIColor *waveColor; // 波浪的颜色
@property (nonatomic, assign) CGFloat waveWidth;  // 波浪的宽度
@property (nonatomic, assign) CGFloat waveSpeed;  // 波浪流动速度  
@property (nonatomic, assign) CGFloat amplitude;  // 波浪的振幅
@property (nonatomic, assign) CGFloat cycle;      // 波浪的周期
@property (nonatomic, assign) CGFloat waveHeight; // 波浪的高度



- (void)start;
- (void)stop;
- (instancetype)initWithFrame:(CGRect)frame waveType:(XYWaveType)type; 

@end

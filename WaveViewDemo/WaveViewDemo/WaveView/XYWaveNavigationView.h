//
//  XYWaveNavigationView.h
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "XYWaveView.h"


typedef NS_ENUM(NSInteger, XYWaveType) {
    
    XYWaveTypeSine,   // 正弦波浪
    XYWaveTypeCosine  // 余弦波浪
};


@interface XYWaveNavigationView : XYWaveView

- (instancetype)initWithFrame:(CGRect)frame waveType:(XYWaveType)type; 

@end

//
//  ViewController.m
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "ViewController.h"
#import "XYWaveNavigationView.h"

@interface ViewController ()
{
    XYWaveNavigationView *_waveView1;
    XYWaveNavigationView *_waveView2;
    BOOL _flag;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _flag = YES;
    
    // 创建正弦波浪
    XYWaveNavigationView *waveView = [[XYWaveNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    waveView.alpha = 0.6;
    waveView.waveColor = [UIColor redColor];
    
    waveView.waveSpeed = 0.1;
    
    [self.view addSubview:waveView];
    _waveView1 = waveView;
    
    // 创建余弦波浪
    XYWaveNavigationView *waveView2 = [[XYWaveNavigationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) waveType:XYWaveTypeCosine];
    waveView2.alpha = 0.6;
    
    waveView2.waveSpeed = 0.1;
    
    [self.view addSubview:waveView2];
    _waveView2 = waveView2;
    
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    [_waveView1 start];
    [_waveView2 start];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    if (_flag == YES) {
        [_waveView1 stop];
        [_waveView2 stop];
    } else {
        [_waveView1 start];
        [_waveView2 start];
    }
    
    _flag = !_flag;
}


- (void)dealloc {

    NSLog(@"%s", __FUNCTION__);
}

@end

//
//  XYViewController.m
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "XYViewController.h"
#import "XYWaveProgressView.h"

@interface XYViewController () {
    
    XYWaveProgressView *_progressView;
}

@end

@implementation XYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progressView = [[XYWaveProgressView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    [self.view addSubview:_progressView];
    [_progressView start];
    [_progressView setProgressTextFont:[UIFont systemFontOfSize:12]];
    [_progressView setProgressTextColor:[UIColor whiteColor]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
    [_progressView start];
}



@end

//
//  ViewController.m
//  WaveViewDemo
//
//  Created by mofeini on 16/12/23.
//  Copyright © 2016年 com.test.demo. All rights reserved.
//

#import "ViewController.h"
#import "XYWaveView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XYWaveView *waveView = [[XYWaveView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, 220)];
    
    waveView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:waveView];
}




@end

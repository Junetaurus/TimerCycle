//
//  ViewController.m
//  Timer
//
//  Created by Zhang on 2019/7/11.
//  Copyright © 2019 cue. All rights reserved.
//

#import "ViewController.h"
#import "JProxy.h"
#import "JProxy1.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     会导致循环引用，内存泄露
     */
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    /**
     解决办法
     block ios(10.0)
     加个第三方
     */
    //block
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerTest];
//    }];
    
    //NSProxy
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[JProxy initWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    //NSObject
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[JProxy1 initWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
}

- (void)timerTest {
    NSLog(@"%s",__func__);
}

- (void)dealloc {
    [_timer invalidate];
    NSLog(@"%s",__func__);
}

@end

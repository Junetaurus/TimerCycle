//
//  JProxy1.m
//  Timer
//
//  Created by Zhang on 2019/7/11.
//  Copyright © 2019 cue. All rights reserved.
//

#import "JProxy1.h"

@interface JProxy1 ()

@property (nonatomic, weak) id target;

@end

@implementation JProxy1

+ (instancetype)initWithTarget:(id)target {
    JProxy1 *proxy = [[JProxy1 alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return _target;
}

@end

//
//  JProxy.m
//  Timer
//
//  Created by Zhang on 2019/7/11.
//  Copyright © 2019 cue. All rights reserved.
//

#import "JProxy.h"

@interface JProxy ()

@property (nonatomic, weak) id target;

@end

@implementation JProxy

+ (instancetype)initWithTarget:(id)target {
    JProxy *proxy = [JProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:_target];
}

@end

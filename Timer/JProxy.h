//
//  JProxy.h
//  Timer
//
//  Created by Zhang on 2019/7/11.
//  Copyright © 2019 cue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JProxy : NSProxy

+ (instancetype)initWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END

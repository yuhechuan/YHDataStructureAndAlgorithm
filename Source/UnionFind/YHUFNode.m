//
//  YHUFNode.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/12.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHUFNode.h"

@implementation YHUFNode

- (instancetype)initWithValue:(id<NSCopying>)value {
    if (self = [super init]) {
        _value = value;
        _parent = self;
        _size = 1;
        _rank = 1;
    }
    return self;
}

@end

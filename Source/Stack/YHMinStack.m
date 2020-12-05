//
//  YHMinStack.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/5.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHMinStack.h"
#import "YHStack.h"

@interface YHMinStack ()

@property (nonatomic, strong) YHStack *stack;
@property (nonatomic, strong) YHStack *minStack;
@property (nonatomic, strong) YHComparator *comparator;

@end

@implementation YHMinStack

- (instancetype)initWithComparator:(YHComparator *)comparator {
    if (self = [super init]) {
        _comparator = comparator;
    }
    return self;
}

- (void)push:(id)x {
    // 正常栈
    [self.stack push:x];
    // 维护最小 数据
    if ([self.minStack isEmpty]) {
        [self.minStack push:x];
    } else {
        id old = [self.minStack peek];
        id min = x;
        if ([self compare:x p2:old]) {
            min = old;
        }
        [self.minStack push:min];
    }
}

- (void)pop {
    [self.stack pop];
    [self.minStack pop];
}

- (id)top {
    return [self.stack peek];
}

- (id)getMin {
    return [self.minStack peek];
}

- (YHStack *)stack {
    if (!_stack) {
        _stack = [[YHStack alloc]init];
    }
    return _stack;
}

- (YHStack *)minStack {
    if (!_minStack) {
        _minStack = [[YHStack alloc]init];
    }
    return _minStack;
}

- (int)compare:(id)p1 p2:(id)p2 {
    if (self.comparator.icompare) {
        return self.comparator.icompare(p1,p2);
    }
    int pv1 = [p1 intValue];
    int pv2 = [p2 intValue];
    return pv1 - pv2;
}

@end

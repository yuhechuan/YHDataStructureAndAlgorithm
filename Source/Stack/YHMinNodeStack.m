//
//  YHMinNodeStack.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/5.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHMinNodeStack.h"

@interface YHMinNode : NSObject

@property (nonatomic, strong) id val;
@property (nonatomic, strong) id min;
@property (nonatomic, strong) YHMinNode *next;

@end

@implementation YHMinNode

@end

@interface YHMinNodeStack ()

@property (nonatomic, strong) YHMinNode *head;
@property (nonatomic, strong) YHComparator *comparator;

@end

@implementation YHMinNodeStack

- (instancetype)initWithComparator:(YHComparator *)comparator {
    if (self = [super init]) {
        _comparator = comparator;
    }
    return self;
}

- (void)push:(id)x {
    // 维护最小 数据
    YHMinNode *node = [[YHMinNode alloc]init];
    node.val = x;
    node.next = self.head;
    id minx = x;
    if (self.head.min && [self compare:x p2:self.head.min]) {
        minx = self.head.min;
    }
    node.min = minx;
    self.head = node;
}

- (void)pop {
    self.head = self.head.next;
}

- (id)top {
    return self.head.val;
}

- (id)getMin {
    return self.head.min;
}

- (YHMinNode *)head {
    if (!_head) {
        _head = [[YHMinNode alloc]init];
    }
    return _head;
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

//
//  YHBinaryHeap.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/9/29.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHBinaryHeap.h"

@implementation YHBinaryHeap {
    YHComparator *_comparator;
    NSMutableArray *_elements;
}

- (instancetype)initWithComparator:(YHComparator *)comparator {
    return [self initWithComparator:comparator elements:nil];
}

- (instancetype)initWithComparator:(YHComparator *)comparator
                          elements:(NSArray *)elements {
    if (self = [super init]) {
        _comparator = comparator;
        _elements = [NSMutableArray array];
        [self heapify:elements];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        _elements = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)size {
    return _elements.count;
}

- (BOOL)isEmpty {
    return _elements.count == 0;
}

- (void)clear {
    [_elements removeAllObjects];
}

- (id)get {
    if (_elements == 0) {
        return nil;
    }
    return _elements[0];
}

- (void)add:(id)element {
    if (!element) {
        return;
    }
    [_elements addObject:element];
    // 调整
    int index = (int)(_elements.count - 1);
    [self siftUp:index];
}

// 上滤
- (void)siftUp:(int)index {
    id e = _elements[index];
    while (index > 0) {
        int pindex = (index - 1) >>1;
        id p = _elements[pindex];
        if (![self compare:e b:p]) {
            break;;
        }
        // 交换
        _elements[index] = p;
        index = pindex;
    }
    _elements[index] = e;
}

- (id)remove {
    if ([self isEmpty]) {
        return nil;
    }
    id root = _elements[0];
    int lastIndex = (int)[self size] - 1;
    _elements[0] = _elements[lastIndex];
    [_elements removeLastObject];
    [self siftDown:0];
    return root;
}

// 下滤
- (void)siftDown:(int)index {
    // 第一个叶子节点的索引 就是  非叶子节点的数量
    id e = _elements[index];
    int half = (int)([self size] >> 1);
    while (index < half) {
        // 1.只有左叶子节点 2. 左右都有
        int childindex = (index << 1) + 1;
        id child = _elements[childindex];
        
        // 右子节点
        int rightIndex = childindex + 1;
        if (rightIndex < [self size] && [self compare:_elements[rightIndex] b:child]) {
            childindex = rightIndex;
            child = _elements[rightIndex];
        }
        if ([self compare:e b:child]) {
            break;
        }
        _elements[index] = child;
        index = childindex;
    }
    _elements[index] = e;
}

- (id)replace:(id)element {
    if (!element) {
        return nil;
    }
    id root = nil;
    if ([self size] == 0) {
        [_elements addObject:element];
    } else {
        root = _elements[0];
        _elements[0] = element;
        [self siftDown:0];
    }
    return root;
}

- (void)heapify:(NSArray *)elements {
    if (!elements || elements.count == 0) {
        return;
    }
    [_elements addObjectsFromArray:elements];
    int size = (int)[self size];
    //1. 自上而下的上滤
//    for (int i = 1; i < size; i ++) {
//        [self siftUp:i];
//    }
    
    //2.自下而上的下滤 效率更高一些
    for (int i = (size >> 1) - 1; i >= 0; i --) {
        [self siftDown:i];
    }
}

- (BOOL)compare:(id)a
             b:(id)b {
    if (_comparator != nil) {
        return _comparator.compare(a,b);
    }
    return a > b;
}

- (NSArray *)heapElements {
    return _elements.copy;
}

- (id)root {
    return @(0);
}
/**
 * how to get the left child of the node
 */
- (id)left:(id)node {
    int index = [node intValue];
    index = (index << 1) + 1;
    return index >= _elements.count ? nil :@(index);
}
/**
 * how to get the right child of the node
 */
- (id)right:(id)node {
    int index = [node intValue];
    index = (index << 1) + 2;
    return index >= _elements.count ? nil :@(index);
}
/**
 * how to print the node
 */
- (id)string:(NSNumber *)node {
    return _elements[[node intValue]];
}


@end

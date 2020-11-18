//
//  YHHeapSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/16.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHHeapSort.h"

@implementation YHHeapSort {
    int _heapSize;
}
/**
 * 堆排序 -  对选择排序的一种优化
 * 时间复杂度 O(n *logn)
 * 空间复杂度   O(1)
 * 不是稳定的排序
 */
- (void)realizeSort {
    // 原地建堆
    _heapSize = (int)self.sortArray.count;
    for (int i = (_heapSize >> 1) - 1; i >= 0; i --) {
        [self siftDown:i];
    }
    
    while (_heapSize > 1) {
        [self swap:0 p2:_heapSize -1];
        _heapSize --;
        [self siftDown:0];
    }
}

- (void)siftDown:(int)index {
    if (index >= _heapSize) {
        return;
    }
    // 第一个叶子节点的索引 就是  非叶子节点的数量
    NSObject *e = self.sortArray[index];
    int half = (int)(_heapSize >> 1);
    while (index < half) {
        // 1.只有左叶子节点 2. 左右都有
        int childindex = (index << 1) + 1;
        NSObject *child = self.sortArray[childindex];
        
        // 右子节点
        int rightIndex = childindex + 1;
        if (rightIndex < _heapSize && [self cmpv:self.sortArray[rightIndex] v2:child] > 0) {
            childindex = rightIndex;
            child = self.sortArray[rightIndex];
        }
        if ([self cmpv:e v2:child] >= 0) {
            break;
        }
        self.sortArray[index] = child;
        index = childindex;
    }
    self.sortArray[index] = e;
}

@end

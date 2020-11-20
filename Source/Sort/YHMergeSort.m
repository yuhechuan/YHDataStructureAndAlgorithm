//
//  YHMergeSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/18.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHMergeSort.h"

@implementation YHMergeSort {
    NSMutableArray *_leftArr;
}
/**
 * 归并排序
 * 最坏时间复杂度 O(n*logn)
 * 最好时间复杂度 O(n*logn)
 * 空间复杂度   O(n) = O(n/2 + logn )
 * 稳定的排序
 */
- (void)realizeSort {
    _leftArr = [NSMutableArray arrayWithArray:[self.sortArray subarrayWithRange:NSMakeRange(0, self.sortArray.count >>1)]];
    int end = (int)self.sortArray.count;
    [self mergeSort:0 end:end];
}

/**
 * 对 [begin end) 区间进行  归并排序
 */
- (void)mergeSort:(int)begin
              end:(int)end {
    if (end - begin < 2) {
        return;
    }
    int mid = (begin + end) >> 1;
    [self mergeSort:begin end:mid];
    [self mergeSort:mid end:end];
    [self merge:begin mid:mid end:end];
}
/**
 * 将 [begin mid) 好喝 [mid end) 合并成一个有序序列
 */
- (void)merge:(int)begin
          mid:(int)mid
          end:(int)end {
    int li = 0;
    int le = mid - begin;
    int ri = mid;
    int re = end;
    int ai = begin;
    // 先备份左边 数据
    for (int i = li; i < le; i ++) {
        _leftArr[i] = self.sortArray[begin + i];
    }
    
    // 移动排序
    while (li < le) {
        if (ri < re && [self cmpv:self.sortArray[ri] v2:_leftArr[li]] < 0) {
            self.sortArray[ai++] = self.sortArray[ri++];
        } else {
            self.sortArray[ai++] = _leftArr[li++];
        }
    }
}



@end

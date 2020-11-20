//
//  YHQuickSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuickSort.h"

@implementation YHQuickSort
/**
 * 归并排序
 * 最坏时间复杂度 O(n^2)
 * 最好时间复杂度 O(n*logn)
 * 空间复杂度   O(logn)
 * 稳定的排序
 */
- (void)realizeSort {
    [self quickSort:0 end:(int)self.sortArray.count];
}
/**
 * 对[begin,  end)范围内的 数据进行快排
 */
- (void)quickSort:(int)begin
              end:(int)end {
    if (end - begin < 2) {
        return;
    }
    // 确定轴点位置
    int keyIndex = [self pivotIndex:begin end:end];
    // 左边序列和右边序列比较均匀
    [self quickSort:begin end:keyIndex];
    [self quickSort:keyIndex + 1 end:end];
}

/**
 * 构造出[begin,  end)范围内的 轴点
 */
- (int)pivotIndex:(int)begin
               end:(int)end {
    // begin 和随机一个
    int random = [self getRandom:begin to:end];
    [self swap:begin p2:random];
    // 确定轴点位置
    NSObject *pivot = self.sortArray[begin];
    end --;
    while (begin < end) {
        // 从右往左
        while (begin < end) {
            if ([self cmpv:pivot v2:self.sortArray[end]] < 0) {
                end --;
            } else {
                self.sortArray[begin ++] = self.sortArray[end];
                break;
            }
        }
        // 从左往右
        while (begin < end) {
            if ([self cmpv:pivot v2:self.sortArray[begin]] > 0) {
                begin ++;
            } else {
                self.sortArray[end --] = self.sortArray[begin];
                break;
            }
        }
    }
    self.sortArray[begin] = pivot;
    return begin;
}

// 随机选择一个元素
- (int)getRandom:(int)from to:(int)to {
    return (int)(from + (arc4random() % (to - from)));
}

@end

//
//  YHSelectionSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/13.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHSelectionSort.h"

@implementation YHSelectionSort
/**
 * 选择排序排序
 * 找出最大的和末尾元素进行交换
 * 最坏时间复杂度 O(n^2)
 * 最好时间复杂度 O(n^2)
 * 不稳定
 */
- (void)realizeSort {
    int length = (int)self.sortArray.count;
    for (int i = length - 1; i >= 0; i --) {
        int maxIndex = 0;
        for (int j = 1; j <= i ; j ++) {
            if ([self cmp:maxIndex p2:j]) {
                maxIndex = j;
            }
        }
        // 交换
        [self swap:maxIndex p2:i];
    }
}

@end

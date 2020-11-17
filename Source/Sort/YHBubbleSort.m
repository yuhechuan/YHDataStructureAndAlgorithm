//
//  YHBubbleSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/13.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHBubbleSort.h"

@implementation YHBubbleSort

/**
 * 冒泡排序
 * 两两交换
 * 最坏时间复杂度 O(n^2)
 * 最好时间复杂度O(n)
 * 稳定
 */
- (void)realizeSort {
    int length = (int)self.sortArray.count;

    for (int i = length - 1; i >= 0; i --) {
        int sortIndex = 0;
        for (int j = 1; j <= i ; j ++) {
            if ([self cmp:j p2:j -1] < 0) {
              // 交换
              [self swap:j p2:j -1];
              sortIndex = j;
            }
        }
        i = sortIndex;
    }
}

@end

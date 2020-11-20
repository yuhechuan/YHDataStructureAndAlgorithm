//
//  YHRadixSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/20.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHRadixSort.h"

@implementation YHRadixSort

/**
 * 基数排序
 * 时间复杂度 O(d * (n+ k))
 * 空间复杂度O (n +k)
 */

- (void)realizeSort {
    // 获取最大值
    int max = INT_MIN;
    int sortCount = (int)self.sortArray.count;

    for (int i = 0; i < sortCount; i ++) {
        int cur = [self value:self.sortArray[i]];
        max = MAX(cur, max);
    }
    
    for (int d = 1; d < max; d *= 10) {
        [self countingSort:d];
    }
}

- (void)countingSort:(int)divider {
    // 获取最大值
    int sortCount = (int)self.sortArray.count;
    int rateCount = 10;
    // 开辟内存空间
    NSMutableArray *counts = [NSMutableArray array];
    NSMutableArray *sorted = [NSMutableArray array];

    for (int i = 0; i < rateCount; i ++) {
       [counts addObject:@(0)];
    }
    
    // 统计每个整数出现的次数
    for (int i = 0; i < sortCount; i ++) {
        int index = [self value:self.sortArray[i]] / divider % 10;
        counts[index] = @([counts[index] intValue] + 1);
        [sorted addObject:@(0)];
    }
    // 累计索引
    for (int i = 1; i < rateCount; i ++) {
        counts[i] = @([counts[i - 1] intValue] + [counts[i] intValue]);
    }
    
    // 从后往前 遍历把数据
    for (int i = sortCount -1; i >= 0; i --) {
        int cur = [self value:self.sortArray[i]] / divider % 10;
        int index = [counts[cur] intValue] -1;
        counts[cur] = @(index);
        sorted[index] = self.sortArray[i];
    }
    self.sortArray = sorted;
}

@end

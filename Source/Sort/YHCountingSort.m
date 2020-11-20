//
//  YHCountingSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/20.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHCountingSort.h"


@implementation YHCountingSort

/**
 * 自定义对象 可以提供排序的整数类型
 */

/**
 * 时间复杂度 O(n + k)
 * 空间负责度 O(n + k)
 * 不稳定的排序
 */
// 优化版本
- (void)realizeSort {
    // 获取最大值
    int min = INT_MAX;
    int max = INT_MIN;
    int sortCount = (int)self.sortArray.count;

    for (int i = 0; i < sortCount; i ++) {
        int cur = [self value:self.sortArray[i]];
        min = MIN(cur, min);
        max = MAX(cur, max);
    }
    
    int rateCount = max - min + 1;
    // 开辟内存空间
    NSMutableArray *counts = [NSMutableArray array];
    NSMutableArray *sorted = [NSMutableArray array];

    for (int i = 0; i < rateCount; i ++) {
       [counts addObject:@(0)];
    }
    
    // 统计每个整数出现的次数
    for (int i = 0; i < sortCount; i ++) {
        int index = [self value:self.sortArray[i]] - min;
        counts[index] = @([counts[index] intValue] + 1);
        [sorted addObject:@(0)];
    }
    // 累计索引
    for (int i = 1; i < rateCount; i ++) {
        counts[i] = @([counts[i - 1] intValue] + [counts[i] intValue]);
    }
    
    // 从后往前 遍历把数据
    for (int i = sortCount -1; i >= 0; i --) {
        int cur = [self value:self.sortArray[i]];
        int index = [counts[cur - min] intValue] -1;
        counts[cur - min] = @(index);
        sorted[index] = self.sortArray[i];
    }
    self.sortArray = sorted;
}

// 第一个版本
- (void)realizeSort1 {
    // 获取最大值
    int min = [[self.sortArray valueForKeyPath:@"@min.integerValue"] intValue];
    int max = [[self.sortArray valueForKeyPath:@"@max.integerValue"] intValue];
    int rateCount = max - min + 1;
    // 开辟内存空间
    NSMutableArray *counts = [NSMutableArray array];
    for (int i = 0; i < rateCount; i ++) {
        [counts addObject:@(0)];
    }
    
    // 统计每个整数出现的次数
    for (int i = 0; i < self.sortArray.count; i ++) {
        int jc = [self.sortArray[i] intValue];
        counts[jc] = @([counts[jc] intValue] + 1);
    }
    
    // 开始排序
    int index = 0;
    for (int i = 0; i < counts.count; i ++) {
        while ([counts[i] intValue] > 0) {
            counts[i] = @([counts[i] intValue] - 1);
            self.sortArray[index] = @(i);
            index ++;
        }
    }
}

@end

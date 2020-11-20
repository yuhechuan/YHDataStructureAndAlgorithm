//
//  YHShellSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHShellSort.h"

@implementation YHShellSort {
    NSMutableArray *_stepSequence;
}

- (void)realizeSort {
    // 构造步长序列
    NSArray *stepSequence = [self sedegwickStepSequence:(int)self.sortArray.count];
    for (NSNumber *step in stepSequence) {
        [self shellSort:[step intValue]];
    }
}

/**
 * 分成几列进行排序
 */
- (void)shellSort:(int)step {
    // 对每一列进行排序
    for (int col = 0; col < step; col ++) {
        int length = (int)self.sortArray.count;
        for (int i = col + step; i < length; i+=step) {
            int cur = i;
            while (cur > col && [self cmp:cur p2:cur - step] < 0) {
                [self swap:cur p2:cur -step];
                cur-= step;
            }
        }
    }
}

/**
 * shell步长序列
 * 最坏时间复杂度 O(n^2)
 */
- (NSArray *)shellStepSequence {
    NSMutableArray *steps = [NSMutableArray array];
    int step = (int)self.sortArray.count;
    while ((step >>= 1) > 0) {
        [steps addObject:@(step)];
    }
    return steps;
}

/**
 * 已知最好步长序列
 * 最坏时间复杂度 O(n^ 4/3)
 */
- (NSArray *)sedegwickStepSequence:(int)count {
    NSMutableArray *steps = [NSMutableArray array];
    int k = 0;
    int step = 0;
    while (1) {
        if (k % 2 == 0) {
            int pow1 = pow(2, k >> 1);
            step = 1 + 9 * (pow1 *pow1 - pow1);
        } else {
            int pow1 = pow(2, (k -1) >> 1);
            int pow2 = pow(2, (k +1) >> 1);
            step = 1 + 8 *pow1 *pow2 - 6*pow2;
        }
        if (step >= count) {
            break;
        }
        [steps insertObject:@(step) atIndex:0];
        k ++;
    }
    return steps;
}

@end

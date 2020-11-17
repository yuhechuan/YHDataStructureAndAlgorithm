//
//  YHSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/13.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHSort.h"

/**
 * 原地算法
 * 不依赖 额外的资源 或者依赖少数的额外资源 仅靠输入覆盖输出
 * 空间复杂度为O(1) 的算法称为原地算法
 */
@implementation YHSort

- (void)sort:(NSMutableArray *)sortArray {
    if (!sortArray || sortArray.count < 2) {
        return;
    }
    _swapCount = 0;
    _cmpCount = 0;
    self.time = 0;
    self.sortArray = sortArray;
    NSDate *startTime = [NSDate date];
    [self realizeSort];
    self.time = -[startTime timeIntervalSinceNow];
}

- (void)realizeSort {
    // 子类实现
}

- (int)cmp:(int)p1 p2:(int)p2 {
    int pv1 = [self.sortArray[p1] intValue];
    int pv2 = [self.sortArray[p2] intValue];
    return [self cmpv:pv1 v2:pv2];
}

- (int)cmpv:(int)v1 v2:(int)v2 {
    _cmpCount ++;
    if (v1 < v2) {
        return -1;
    } else if (v1 > v2) {
        return 1;
    } else {
        return 0;
    }
}

- (void)swap:(int)p1 p2:(int)p2 {
    _swapCount ++;
    NSNumber *tmp = self.sortArray[p1];
    self.sortArray[p1] = self.sortArray[p2];
    self.sortArray[p2] = tmp;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"%@: 交换次数:%d 比较次数:%d 所花时间:%f",NSStringFromClass([self class]),_swapCount,_cmpCount,self.time];
}

@end

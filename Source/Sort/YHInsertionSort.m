//
//  YHInsertionSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/17.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHInsertionSort.h"

@implementation YHInsertionSort
/**
 * 插入排序
 * 最坏时间复杂度 O(n^2)
 * 最好时间复杂度 O(n)
 * 空间复杂度   O(1)
 * 稳定的排序
 */
/**
 * 逆序对 顺序不对
 * 插入排序的时间复杂度跟 数据的逆序对的数量
 */

- (void)realizeSort {
    int length = (int)self.sortArray.count;
    for (int i = 1; i < length; i ++) {
        int insertIndex = [self search:i];
        NSObject *tmp = self.sortArray[i];
        // 应该是网右边挪  但是可变数字直接支持 插入
        [self.sortArray removeObjectAtIndex:i];
        [self.sortArray insertObject:tmp atIndex:insertIndex];
    }
}

- (void)realizeSort3 {
    int length = (int)self.sortArray.count;
    for (int i = 1; i < length; i ++) {
        int insertIndex = [self search:i];
        [self insert:i dest:insertIndex];
    }
}
/**
 * 把source位置元素插入到目标dest位置
 */
- (void)insert:(int)source dest:(int)dest {
    NSObject *tmp = self.sortArray[source];
    for (int i = source; i > dest; i --) {
       self.sortArray[i] = self.sortArray[i -1];
    }
    self.sortArray[dest] = tmp;
}

/**
 * 找到当前索引 待插入位置
 * 已排好序的区间 [0,index)
 */
- (int)search:(int)index {
    int begin = 0;
    int end = index;
    NSObject *v = self.sortArray[index];
    while (begin < end) {
       int mid = (begin + end) >> 1;
       if ([self cmpv:v v2:self.sortArray[mid]] < 0) {
           end = mid;
       } else {
           begin = mid + 1;
       }
    }
    return end;
}

/**
 * 第二个版本
 */
- (void)realizeSort2 {
    int length = (int)self.sortArray.count;
    for (int i = 1; i < length; i ++) {
        int cur = i;
        NSObject *tmp = self.sortArray[cur];
        while (cur > 0 && [self cmpv:tmp v2:self.sortArray[cur - 1]] < 0) {
            self.sortArray[cur] = self.sortArray[cur - 1];
            cur--;
        }
        self.sortArray[cur] = tmp;
    }
}

/**
 * 第一个版本
 */
- (void)realizeSort1 {
    int length = (int)self.sortArray.count;
    for (int i = 1; i < length; i ++) {
        int cur = i;
        while (cur > 0 && [self cmp:cur p2:cur - 1] < 0) {
            [self swap:cur p2:cur -1];
            cur--;
        }
    }
}



@end

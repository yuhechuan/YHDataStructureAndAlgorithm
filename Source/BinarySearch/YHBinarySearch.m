//
//  YHBinarySearch.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/18.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHBinarySearch.h"

@interface YHBinarySearch ()

@property (nonatomic, strong) YHComparator *comparator;

@end

@implementation YHBinarySearch

- (instancetype)initWithComparator:(YHComparator *)comparator {
    if (self = [super init]) {
        _comparator = comparator;
    }
    return self;
}

/**
 * 搜索位置
 */
- (int)indexOf:(NSArray *)array
             v:(NSObject *)v {
    if (!array || !v || array.count == 0) {
        return -1;
    }
    int begin = 0;
    int end = (int)array.count;
    while (begin < end) {
        int mid = (begin + end) >> 1;
        if ([self cmpv:v v2:array[mid]] > 0) {
            begin = mid + 1;
        } else if ([self cmpv:v v2:array[mid]] < 0) {
            end = mid;
        } else {
            return mid;
        }
    }
    return -1;
}

/**
 * 搜索插入位置
 * 找到第一个比我大的位置
 */
- (int)search:(NSArray *)array
            v:(NSObject *)v {
    if (!array || !v || array.count == 0) {
        return -1;
    }
    int begin = 0;
    int end = (int)array.count;
    while (begin < end) {
        int mid = (begin + end) >> 1;
        if ([self cmpv:v v2:array[mid]] < 0) {
            end = mid;
        } else {
            begin = mid + 1;
        }
    }
    return end;
}

- (int)cmpv:(NSObject *)v1 v2:(NSObject *)v2 {
    if (self.comparator.icompare) {
        return self.comparator.icompare(v1,v2);
    }
    return 0;
}

@end

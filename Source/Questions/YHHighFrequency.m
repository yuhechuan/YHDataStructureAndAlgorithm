//
//  YHHighFrequency.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/12/21.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHHighFrequency.h"

@implementation YHHighFrequency
/**
 * 283 移动 0
 */
+ (void)moveZeroes:(NSMutableArray *)nums {
    int count = (int)nums.count;
    if (!nums || count == 0) {
        return;
    }
    int cur = 0;
    for (int i = 1; i < count; i ++) {
        if ([nums[i] intValue] == 0 || cur == i) {
            continue;
        }
        nums[cur] = nums[i];
        nums[i] = @(0);
        cur ++;
    }
}

/**
 * 1. 两数之和
 *  假设只有一种答案 不能重复利用数组中 同一元素
 */
+ (NSArray *)twoSum:(NSArray *)nums
             target:(int)target {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < nums.count; i ++) {
        NSNumber *key = @(target - [nums[i] intValue]);
        if (!dict[key]) {
            dict[key] = @(i);
        } else {
            return @[key,dict[key]];
        }
    }
    return nil;
}

/**
 * 15. 三数之和
 * 不能重复利用数组中 同一元素是否是 0
 */
+ (NSArray *)threeSum:(NSArray *)nums {
    return nil;
}

@end

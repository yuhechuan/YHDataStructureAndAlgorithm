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
    if (!nums || nums.count < 3) {
        return @[];
    }
    
    // 排序
    nums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    NSMutableArray *list = [NSMutableArray array];
    
    int length = (int)nums.count;
    for (int i = 0; i < length -2; i ++) {
        // 去重
        if (i > 0 && [nums[i] intValue] == [nums[i - 1] intValue]) {
            continue;
        }
        
        int l = i + 1;
        int r = length -1;
        int remain = - [nums[i] intValue];
        while (l < r) {
            int sum = [nums[l] intValue] + [nums[r] intValue];
            if (sum == remain) {
                // 找到了
                [list addObject:@[nums[i],nums[l],nums[r]]];
                // 去重
                while (l < r && [nums[l] intValue] == [nums[l + 1] intValue]) l++;
                while (l < r && [nums[r] intValue] == [nums[r - 1] intValue]) l--;
                
                l++;
                r--;
            } else if (sum < remain) {
                l ++;
            } else {
                r --;
            }
        }
    }
    return list;
}

/**
 * 15,pow(x,n) x的n次方
 *  快速幂
 *  分治 思想
 *  -5 >> 1  == -3
 *  -1>>1 == -1
 *  时间复杂度 O(logn)
 *  空间复杂度O (logn)
 */
+ (double)myPow1:(double)x n:(int)n {
    if (n == 0) {
        return 1;
    }
    if (n == -1) {
        return 1 / x;
    }
    BOOL odd = (n & 1) == 1;
    double half = [self myPow:x n:(n >> 1)];
    half *= half;
    // x = n < 0 ? (1/ x) :x;
    return odd ? half * x : half;
}
/**
 * 快速幂
 * 时间复杂度O(logn)
 * 空间复杂度O (1)
 */
+ (double)myPow:(double)x n:(int)n {
    BOOL neg = n < 0;
    long y = neg ? -(long)n : n;
    double result = 1.0;
    while (y > 0) {
        if ((y & 1) == 1) {
            result *= x;
        }
        x *= x;
        y >>= 1;
    }
    return neg ? (1.0/result): result;
}
/**
 * 模上z
 */
+ (int)myPow:(int)x y:(int)y z:(int)z {
    if (x < 0 || y < 0 || z == 0 ) {
        return 0;
    }
    x %= z;
    int result = 1 % z;
    while (y > 0) {
        if ((y & 1) == 1) {
            result = (result * x) %z;
        }
        x = (x * x) % z;
        y >>= 1;
    }
    return result;
}

/**
 * 62. 圆圈中最后剩下的数
 *    f(10,3) = f(11, 3) - 3;
 * f(n,m) = (f(n-1,m) + m) % n;
 */
+ (int)lastRemaining1:(int)n m:(int)m {
    if (n == 1) {
        return 0;
    }
    return ([self lastRemaining:n -1 m:m] + m ) % n;
}

+ (int)lastRemaining:(int)n m:(int)m {
    // 当一个人时 为0
    int res = 0;
    // i 表示有多少个人
    for (int i = 2; i <= n; i ++) {
        res = (res + m) % i;
    }
    return res;
}

// 要不是从 0开始 加上1,2,3..得出编号为几的  res + off

/**
 * 54. 螺旋矩阵
 @[@[@(1),@(2),@(3), @(4)],
   @[@(4),@(5),@(6), @(7)],
   @[@(8),@(9),@(10),@(11)]];
 */

+ (NSArray *)spiralOrder:(NSArray *)matrix {
    if (!matrix || matrix.count == 0) {
        return @[];
    }
    
    int top = 0;
    int bottom = (int)matrix.count -1;
    int left = 0;
    int right = (int)[matrix[0] count] -1;
    NSMutableArray *result = [NSMutableArray array];
    while (top <= bottom && left <= right) {
        // lefttop -> righttop
        for (int i = left; i <= right; i++) {
            [result addObject:matrix[top][i]];
        }
        top ++;
        
       // righttop - > rightbottom
        for (int i = top; i <= bottom; i++) {
            [result addObject:matrix[i][right]];
        }
        right --;
        
        if ( top > bottom || left > right) {
            break;
        }
        
        for (int i =right ; i >= left; i--) {
            [result addObject:matrix[bottom][i]];
        }
        
        bottom --;
        
        for (int i = bottom; i >= top; i--) {
            [result addObject:matrix[i][left]];
        }
        left ++;
    }
    
    return result.copy;
}

/**
 * 7 整数反转
 */

/**
 * 146 LRU 最近最少使用
 */


@end

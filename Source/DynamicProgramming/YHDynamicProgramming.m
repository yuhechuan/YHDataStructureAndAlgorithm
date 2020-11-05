//
//  YHDynamicProgramming.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/10/28.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHDynamicProgramming.h"

@implementation YHDynamicProgramming
/**
 * 动态规划
 * 暴力搜索 递归 自顶向下
 * 记忆化搜索  自顶向下
 * 递推  自底向上
 *
 * 动态:会变化的状态
 *  常规步骤
 *  1.定义状态 (子问题,原问题的解 dp[i])
 *  2.设置初始状态
 *  3.确定状态转移方程
 */


/**
 * 找零钱 n 钱总数  faces 可使用的币种
 *
 */
- (int)coinChange:(int)n
             faces:(NSArray *)faces {
    if (n < 1 || !faces || faces.count == 0) {
        return -1;
    }
    NSMutableArray *dp = [NSMutableArray array];
    
    for (int i = 0; i < n + 1; i ++) {
        dp[i] = @(0);
    }
    
    for (int i = 1; i < n + 1; i ++) {
        int min = INT_MAX;
        for (NSNumber *f in faces) {
            int fv = [f intValue];
            if (i < fv || [dp[i] intValue] < 0) {
                continue;
            }
            min = MIN(min, [dp[i - fv] intValue]);
        }
        if (min == INT_MAX) {
            dp[i] = @(-1);
        } else {
            dp[i] = @(min +1);
        }
    }
    return [dp[n] intValue];
}

/**
 * 最大连续子序列和
 *  时间复杂度   O(n)
 *  空间复杂度   O(n)
 */
- (int)maxLengthOfSubsequence:(NSArray *)nums {
    if (!nums || nums.count == 0) {
        return 0;
    }
    if (nums.count == 1) {
        return [nums[0] intValue];
    }
    int n = (int)nums.count;
    int dp = [nums[0] intValue];
    int max = dp;
    
    for (int i = 1; i < n; i ++) {
        if (dp > 0) {
            dp = dp + [nums[i] intValue];
        } else {
            dp = [nums[i] intValue];
        }
        max = MAX(max, dp);
    }
    return max;
}

/**
 *  最长上升子序列 长度
 *  时间复杂度   O(n^2)
 *  空间复杂度   O(n)
 */

- (int)maxLengthOfIncreasingSubsequence:(NSArray *)nums {
    if (!nums || nums.count == 0) {
        return 0;
    }
    NSMutableArray *dp = [NSMutableArray array];
    int n = (int)nums.count;
    for (int i = 0; i < n; i ++) {
        dp[i] = @(1);
    }
    int maxLength = [dp[0] intValue];
    for (int i = 1; i < n; i ++) {
        for (int j = 0; j < i;  j ++) {
            if ([nums[j] intValue] < [nums[i] intValue]) {
                dp[i] = @(MAX([dp[i] intValue], [dp[j] intValue]  +1));
            }
        }
        maxLength = MAX(maxLength, [dp[i] intValue]);
    }
    
    return maxLength;
}
/**
 * 二分查找思路
 */

- (int)maxLengthOfIncreasingSubsequence1:(NSArray *)nums {
    if (!nums || nums.count == 0) {
       return 0;
    }
    // 牌堆数组
    NSMutableArray *top = [NSMutableArray array];
    
    for (NSNumber *n in nums) {
        int begin = 0;
        int end = (int)top.count;
        
        while (begin < end) {
            int mid = (begin + end) >>1;
            if ([n intValue] <= [top[mid] intValue]) {
                end = mid;
            } else {
                begin = mid + 1;
            }
        }
        top[begin] = n;
    }
    return (int)top.count;
}

- (int)maxLengthOfIncreasingSubsequence2:(NSArray *)nums {
    if (!nums || nums.count == 0) {
       return 0;
    }
    // 牌堆数组
    NSMutableArray *top = [NSMutableArray array];
    
    for (NSNumber *n in nums) {
        int index = -1;
        for (int i = 0; i < top.count; i ++) {
            int t  = [top[i] intValue];
            if (t >= [n intValue]) {
                index = i;
                break;
            }
        }
        if (index >= 0) {
            top[index] = n;
        } else {
            [top addObject:n];
        }
    }
    
    return (int)top.count;
}

/**
 *  最长公共子序列
 *  时间复杂度   n *m
 *  空间复杂度   m
 *   dp(i,j) 第一个序列前i个元素和 第二个序列前j个元素
 */

- (int)maxLengthOfCommonSubsequence:(NSArray *)nums1
                              nums2:(NSArray *)nums2 {
    if (!nums1 || nums1.count == 0) {
        return 0;
    }
    if (!nums2 || nums2.count == 0) {
        return 0;
    }
    
    NSArray *rows = nums2;
    NSArray *cols = nums1;
    if (nums1.count > nums2.count) {
        rows = nums1;
        cols = nums2;
    }
    
    NSMutableArray *dp = [NSMutableArray array];
    
    for (int i = 0; i <= cols.count; i ++) {
        [dp addObject:@(0)];
    }
    for (int i = 1; i <= rows.count; i ++) {
        int cur = 0;
        for (int j = 1; j <= cols.count; j ++) {
            int leftTop = cur;
            cur = [dp[j] intValue];
            if ([nums1[i - 1] intValue] == [nums2[j - 1] intValue]) {
                dp[j] = @(leftTop  + 1);
            } else {
                dp[j] = @(MAX([dp[j - 1] intValue], [dp[j] intValue]));
            }
        }
    }
    return [dp[cols.count] intValue];
}

/**
 *  最长公共子序列
 *  时间复杂度   n *m
 *  空间复杂度   2 *m
 *   dp(i,j) 第一个序列前i个元素和 第二个序列前j个元素
 */

- (int)maxLengthOfCommonSubsequence3:(NSArray *)nums1
                               nums2:(NSArray *)nums2 {
    if (!nums1 || nums1.count == 0) {
        return 0;
    }
    if (!nums2 || nums2.count == 0) {
        return 0;
    }
    int n1 = (int)nums1.count;
    int n2 = (int)nums2.count;
    NSMutableArray *dp = [NSMutableArray array];
    
    for (int i = 0; i < 2; i ++) {
        NSMutableArray *dpsub = [NSMutableArray array];
        for (int j = 0; j < n2 + 1; j ++) {
            [dpsub addObject:@(0)];
        }
        [dp addObject:dpsub];
    }
    for (int i = 1; i < n1 + 1; i ++) {
        int row = i & 1;
        int prow = (i - 1) & 1;
        for (int j = 1; j < n2 + 1; j ++) {
            if ([nums1[i - 1] intValue] == [nums2[j - 1] intValue]) {
                dp[row][j] = @([dp[prow][j - 1] intValue]  + 1);
            } else {
                dp[row][j] = @(MAX([dp[row][j - 1] intValue], [dp[prow][j] intValue]));
            }
        }
    }
    return [dp[n1 & 1][n2] intValue];
}

- (int)maxLengthOfCommonSubsequence2:(NSArray *)nums1
                               nums2:(NSArray *)nums2 {
    if (!nums1 || nums1.count == 0) {
        return 0;
    }
    if (!nums2 || nums2.count == 0) {
        return 0;
    }
    int n1 = (int)nums1.count;
    int n2 = (int)nums2.count;
    NSMutableArray *dp = [NSMutableArray array];
    
    for (int i = 0; i < n1 + 1; i ++) {
        NSMutableArray *dpsub = [NSMutableArray array];
        for (int j = 0; j < n2 + 1; j ++) {
            [dpsub addObject:@(0)];
        }
        [dp addObject:dpsub];
    }
    for (int i = 1; i < n1 + 1; i ++) {
        for (int j = 1; j < n2 + 1; j ++) {
            if ([nums1[i - 1] intValue] == [nums2[j - 1] intValue]) {
                dp[i][j] = @([dp[i - 1][j - 1] intValue]  + 1);
            } else {
                dp[i][j] = @(MAX([dp[i][j - 1] intValue], [dp[i - 1][j] intValue]));
            }
        }
    }
    return [dp[n1][n2] intValue];
}

- (int)maxLengthOfCommonSubsequence1:(NSArray *)nums1
                               nums2:(NSArray *)nums2 {
     if (!nums1 || nums1.count == 0) {
         return 0;
     }
     if (!nums2 || nums2.count == 0) {
         return 0;
     }
     return [self maxLengthOfCommonSubsequence1:nums1 nums2:nums2 i:(int)nums1.count j:(int)nums2.count];
}
/**
 * 递归
 * K为 nums1.count ,nums1.count2 最小值
 * 空间复杂度 O(K)
 * 时间复杂度 2^n
 */
- (int)maxLengthOfCommonSubsequence1:(NSArray *)nums1
                              nums2:(NSArray *)nums2
                                  i:(int)i
                                  j:(int)j {
    if (i == 0 || j == 0) {
        return 0;
    }
    if ([nums1[i - 1] intValue] == [nums2[j - 1] intValue]) {
        return [self maxLengthOfCommonSubsequence1:nums1 nums2:nums2 i:i - 1 j:j -1] + 1;
    } else {
        return MAX([self maxLengthOfCommonSubsequence1:nums1 nums2:nums2 i:i - 1 j:j], [self maxLengthOfCommonSubsequence1:nums1 nums2:nums2 i:i j:j -1]);
    }
}

/**
 * 最长公共子串的长度
 * 时间复杂度   n *m
 * 空间复杂度   k
 */

- (int)lcs:(NSString *)str1 str2:(NSString *)str2 {
    if (!str1 || str1.length == 0 || !str2 || str2.length == 0) {
        return 0;
    }
    
    NSArray *chars1 = [str1 componentsSeparatedByString:@" "];
    NSArray *chars2 = [str2 componentsSeparatedByString:@" "];
    
    NSArray *rows = chars1;
    NSArray *cols = chars2;
    if (chars1.count < chars2.count) {
        rows = chars2;
        cols = chars1;
    }
    
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i <= cols.count; i ++) {
        [dp addObject:@(0)];
    }
    
    int max = 0;
    for (int i = 1; i <= rows.count; i ++) {
        for (int j = (int)cols.count; j >= 1; j --) {
            if ([rows[i -1] isEqualToString:cols[j -1]]) {
                dp[j] = @([dp[j - 1] intValue] + 1);
                max = MAX(max, [dp[j] intValue]);
            }
        }
    }
    return max;
}

/**
 *  0-1背包最大价值
 *  空间复杂度 O (capacity)
 *  时间复杂度  m*n
 */
- (int)maxValue:(NSArray *)values
        weights:(NSArray *)weights
       capacity:(int)capacity {
    if (!values || values.count == 0 || !weights || weights.count == 0) {
        return 0;
    }
    if (values.count != weights.count || capacity <= 0) {
        return 0;
    }
    int n1 = (int)values.count;
    int n2 = capacity;
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i <= n2 ; i ++) {
        [dp addObject:@(0)];
    }
    
    for (int i = 1; i <= n1 ; i ++) {
        int curweight = [weights[i - 1] intValue];
        for (int j = n2; j >= curweight; j --) {
            if (j > curweight) {
                int vc = j - curweight;
                dp[j] =@( MAX([dp[j] intValue], [values[i -1] intValue] + [dp[vc] intValue]));
            }
        }
    }
    return [dp[n2] intValue];
}


/**
 *  0-1背包刚好装满
 *  空间复杂度 O (capacity)
 *  时间复杂度  m*n
 */

- (int)maxValueExactly:(NSArray *)values
               weights:(NSArray *)weights
              capacity:(int)capacity {
    if (!values || values.count == 0 || !weights || weights.count == 0) {
        return 0;
    }
    if (values.count != weights.count || capacity <= 0) {
        return 0;
    }
    int n1 = (int)values.count;
    int n2 = capacity;
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i <= n2 ; i ++) {
        if (i == 0) {
            [dp addObject:@(0)];
        } else {
            [dp addObject:@(INT_MIN)];
        }
    }
    
    for (int i = 1; i <= n1 ; i ++) {
        int curweight = [weights[i - 1] intValue];
        for (int j = n2; j >= curweight; j --) {
            if (j >= curweight) {
                int vc = j - curweight;
                dp[j] =@( MAX([dp[j] intValue], [values[i -1] intValue] + [dp[vc] intValue]));
            }
        }
    }
    return [dp[n2] intValue] < 0 ? -1 :[dp[n2] intValue];
}

@end

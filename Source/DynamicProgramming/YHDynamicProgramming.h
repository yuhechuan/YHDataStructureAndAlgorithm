//
//  YHDynamicProgramming.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/10/28.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 动态规划
 */
@interface YHDynamicProgramming : NSObject

/**
 * 找零钱
 */
- (int)coinChange:(int)n
             faces:(NSArray *)faces;

/**
 * 最大连续子序列和
 */
- (int)maxLengthOfSubsequence:(NSArray *)nums;
/**
 * 最长上升子序列 长度
 */
- (int)maxLengthOfIncreasingSubsequence:(NSArray *)nums;
- (int)maxLengthOfIncreasingSubsequence1:(NSArray *)nums;

/**
 *  最长公共子序列
 */
- (int)maxLengthOfCommonSubsequence:(NSArray *)nums1
                              nums2:(NSArray *)nums2;
/**
 *  最长公共子串的长度
 */
- (int)lcs:(NSString *)str1 str2:(NSString *)str2;

/**
 * 0-1背包问题
 */
- (int)maxValue:(NSArray *)values
        weights:(NSArray *)weights
       capacity:(int)capacity;

- (int)maxValueExactly:(NSArray *)values
               weights:(NSArray *)weights
              capacity:(int)capacity;

@end

NS_ASSUME_NONNULL_END

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

/**
 *  最长公共子序列
 */
- (int)maxLengthOfCommonSubsequence:(NSArray *)nums1
                              nums2:(NSArray *)nums2;

@end

NS_ASSUME_NONNULL_END

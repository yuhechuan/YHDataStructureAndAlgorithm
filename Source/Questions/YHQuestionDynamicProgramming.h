//
//  YHQuestionDynamicProgramming.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionDynamicProgramming : NSObject

#pragma =============== 动态规划 ========================
/**
 * 剑指 Offer 47. 礼物的最大价值
 */
+ (int)maxValue:(NSArray *)grid;
/**
 * 121 买卖股票的最佳时间
 */
+ (int)maxProfit:(NSArray *)prices;
/**
 * 72.编辑距离 从word1 转成word2
 */
+ (int)minDistance:(NSString *)word1
             word2:(NSString *)word2;
/**
 * 5,最长回文子串
 */
+ (NSString *)longestPalindrome:(NSString *)s;

@end

NS_ASSUME_NONNULL_END

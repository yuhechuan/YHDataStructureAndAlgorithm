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
 * 在一个m×n的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向左或者向下移
 * 动一格直到到达棋盘的右下角。给定一个棋盘及其上面的礼物，请计算你最多能拿到多少价值的礼物？
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

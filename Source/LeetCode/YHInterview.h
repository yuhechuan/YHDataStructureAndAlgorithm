//
//  YHInterview.h
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/7/1.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHOneLinked.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHInterview : NSObject
/*
 只出现一次的数字  给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素
 */
+ (NSInteger)singleNumber:(NSArray *)nums;

/*
 求众数
 */
+ (NSInteger)majorityElement:(NSArray *)nums;

/*
 搜索二维矩阵 II
 */
+ (BOOL)searchMatrix:(NSArray <NSArray *>*)matrix
             target:(NSInteger)target;

/*
 合并两个有序数组
 */

+ (NSArray *)merge:(NSArray *)nums1
             nums2:(NSArray *)nums2;

/*
 鸡蛋掉落 K 个鸡蛋 N层楼
 见图
 */
+ (NSInteger)superEggDrop:(NSInteger)K
                        N:(NSInteger)N;

/*
 乘积最大子序列
 */
+ (NSInteger)maxProduct:(NSArray *)nums;

/*
 判断是否是回文串
 */

+ (BOOL)isPalindrome:(NSString *)string;

/*
 LeetCode（78）：子集
 */

+ (NSArray <NSArray *>*)subsets:(NSArray *)arr;

/*
 LeetCode（70）：爬楼
 */

+ (NSInteger)climbStairs:(NSInteger)n;

/*
 f斐波那契数列
 */
+ (int)fibnq:(int)n;

/*
 反转一个链表
 */

+ (YHNote *)reverseList:(YHNote *)linkNode;

+ (YHNote *)reverseListTwo:(YHNote *)linkNode
                  groupNum:(int)groupNum;

+ (NSInteger)search:(NSArray *)nums
             target:(NSInteger)target;
/**
 * top K
 */
+ (NSArray *)topK:(NSArray *)datas
             size:(int)size;

@end

NS_ASSUME_NONNULL_END

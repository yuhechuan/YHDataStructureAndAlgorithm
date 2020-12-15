//
//  YHQuestions.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/3.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YHNode;
@class YHBNote;

#pragma =============== 数组 排序 ========================

/**
 * 大厂算法题
 */
@interface YHQuestions : NSObject

/**
 * 88合并2个有序数组
 */
+ (NSArray *)merge:(NSArray *)num1 num2:(NSArray *)num2;
/**
 *  75 颜色分类
 */
+ (void)colorClassify:(NSMutableArray *)num;

/**
 * 16 部分排序
 */
+ (NSArray *)subSort:(NSArray *)nums;
/**
 *  977 有序数组的平方
 */
+ (NSArray *)sortedSquares:(NSArray *)nums;

#pragma =============== 链表 ========================

/**
 * 链表  虚拟头结点   快慢指针  多指针
 */

/**
 * 203 移除链表 元素
 */
+ (YHNode *)removeElement:(YHNode *)head
                  element:(id)element;
/**
 * 2. 两数相加
 */
+ (YHNode *)addTwoNumbers:(YHNode *)l1 l2:(YHNode *)l2;
/**
 * 160 相交链表
 */
+ (YHNode *)getIntersectionNode:(YHNode *)headA
                          headB:(YHNode *)headB;
/**
 * 86 分割链表
 */
+ (YHNode *)partition:(YHNode *)head x:(int)x;
/**
 * 234 回文链表
 */
+ (BOOL)isPalindrome:(YHNode *)head;

#pragma =============== 栈、队列 ========================
/**
 * 239. 滑动窗口最大值
 */
+ (NSArray *)maxSlidingWindow:(NSArray *)nums
                            k:(int)k;
/**
 * 654 最大二叉树  根节点是整棵树 最大的节点
 */

+ (YHBNote *)constructMaximumBinaryTree:(NSArray *)nums;
+ (NSArray *)constructMaximumBinaryTreeRoots:(NSArray *)nums;
/**
 *  739 每日温度
 *   [73, 74, 75, 71, 69, 72, 76, 73]
 */
+ (NSArray *)dailyTemperatures:(NSArray *)T;

#pragma =============== 字符串 ========================

/**
 * 01.09.字符串轮转
 */
+ (BOOL)isFlipedString:(NSString *)s1 s2:(NSString *)s2;

/**
 * 572 另一个树的子树
 */
+ (BOOL)isSubtree:(YHBNote *)s t:(YHBNote *)t;
/**
 * 242. 有效的字母异位词
 */
+ (BOOL)isAnagram:(NSString *)s t:(NSString *)t;
/**
 * 151.翻转字符串里面的单词
 */
+ (NSString *)reverseWords:(NSString *)s;
/**
 * 3. 无重复字符的最长子串
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 */
+ (int)lengthOfLongestSubstring:(NSString *)s;

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

#pragma =============== 动态规划 ========================

@end


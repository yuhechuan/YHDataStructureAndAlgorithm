//
//  YHLeetCode.h
//  算法
//
//  Created by ruaho on 2019/6/17.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHDoubleLinked.h"
#import "YHBinarySearchTree.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHLeetCode : NSObject

/*
 1.两数相加
 */
+ (NSArray *)isTwoAdd:(NSArray *)arr
                  num:(NSInteger)num;

/*
 2.两数相加
 2 -> 4 -> 3
 5 -> 6 -> 4
 
 7 -> 0 -> 8
 */
+ (YHDoubleLinked *)twoAddLink:(YHDoubleLinked *)linkOne
                       linkTwo:(YHDoubleLinked *)linkTwo;

/*
 3.无重复字符的最长子串
 */
+ (NSInteger)lengthOfLongestSubstring:(NSString *)string;

/*
 4.寻找两个有序数组的中位数
 */
+ (NSInteger)findMedianSortedArrays:(NSArray *)num1
                               num2:(NSArray *)num2;

/*
 5.最长回文子串
 */
// 中心扩散法
+ (NSString *)longestPalindrome:(NSString *)s;
// 马拉车算法
+ (NSString *)longestPalindrome1:(NSString *)s;

/*
6. Z 字形变换
 */
+ (NSString *)convert:(NSString *)s
            rowNumber:(NSInteger)rowNumber;

/*
 *7.整数反转
 */
+ (NSInteger)reverse:(NSInteger)x;

/*
 *8.字符串转换整数 (atoi)
 */

+ (NSInteger)myAtoi:(NSString *)str;

/*
 9.回文数
 */

+ (BOOL)isPalindrome:(NSInteger)x;

/*
 11.盛最多水的容器
 */
+ (NSInteger)maxArea:(NSArray *)heights;

/*
 * 12.整数转罗马数字
 */
+ (NSString *)intToRoman:(NSInteger)num;

/*
 * 13.罗马数字转整数
 */
+ (NSInteger)romanToInt:(NSString *)str;

/*
 *14最长公共前缀
 */
+ (NSString *)longestCommonPrefix:(NSArray *)strs;

/*
 15.三数相加
 */
+ (BOOL)isThreeAdd:(NSArray *)arr
               num:(NSInteger)num;

/*
 *17. 电话号码的字母组合
 */
+ (NSArray *)letterCombinations:(NSString *)digits;

/*
 18.四数相加
 */
+ (NSArray *)isFourAdd:(NSArray *)arr
           target:(NSInteger)target;

/*
 20. 有效的括号
 */
+ (BOOL)isValid:(NSString *)s;

/*
 22. 括号生成
 */

+ (NSArray *)generateParenthesis:(NSInteger)n;

/*
 26. 删除排序数组中的重复项
 */

+ (NSInteger)removeDuplicates:(NSArray *)arr;

/*
 32. 最长有效括号
 */
+ (NSInteger)longestValidParentheses:(NSString *)s;

/*
 59. 螺旋矩阵 II
 */

+ (NSArray <NSArray *>*)generateMatrix:(NSInteger)n;

/*
 406. 根据身高重建队列
 */

+ (NSArray *)reconstructQueue:(NSArray *)peoples;

/*
 412. Fizz Buzz
 */
+ (NSArray *)fizzBuzz:(NSInteger)n;

/*
 538. 把二叉搜索树转换为累加树
 */
+ (YHBinarySearchTree *)convertBST:(YHBinarySearchTree *)tree;

/*
 781. 森林中的兔子
 */

+ (NSInteger)numRabbits:(NSArray *)answers;

/*
 1000. 合并石头的最低成本
 */
+ (NSInteger)mergeStones:(NSArray *)stones
                       k:(NSInteger)k;

/*
 *1078. Bigram 分词
 */
+ (NSArray *)findOcurrences:(NSString *)text
                      frist:(NSString *)frist
                     second:(NSString *)second;

@end

NS_ASSUME_NONNULL_END

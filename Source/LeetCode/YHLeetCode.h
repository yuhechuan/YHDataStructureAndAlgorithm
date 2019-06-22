//
//  YHLeetCode.h
//  算法
//
//  Created by ruaho on 2019/6/17.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHDoubleLinked.h"

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

@end

NS_ASSUME_NONNULL_END

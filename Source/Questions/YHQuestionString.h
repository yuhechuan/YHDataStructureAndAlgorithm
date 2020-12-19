//
//  YHQuestionString.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHBNote;

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionString : NSObject

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

@end

NS_ASSUME_NONNULL_END

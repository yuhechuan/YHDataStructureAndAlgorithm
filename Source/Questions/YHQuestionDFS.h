//
//  YHQuestionDFS.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionDFS : NSObject

#pragma mark -- DFS 深度优先搜索
/**
 * 17 电话号码的字母组合
 */
+ (NSArray *)letterCombinations:(NSString *)digits;
/**
 * 46 全排列
 */
+ (NSArray *)permute:(NSArray *)arr;
/**
 * 46 全排列2 (给定数据含重复) 不包含重复数据
 */

+ (NSArray *)permuteRepeat:(NSArray *)arr;

/**
 * 22 括号生成
*/
+ (NSArray *)generateParenthesis:(int)n;

@end

NS_ASSUME_NONNULL_END

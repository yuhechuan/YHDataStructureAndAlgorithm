//
//  YHQuestionStackAndQueue.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHBNote;

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionStackAndQueue : NSObject

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

@end

NS_ASSUME_NONNULL_END

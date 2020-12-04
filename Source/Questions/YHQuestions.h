//
//  YHQuestions.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/3.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YHNode;

NS_ASSUME_NONNULL_BEGIN

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


@end

NS_ASSUME_NONNULL_END

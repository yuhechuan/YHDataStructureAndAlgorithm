//
//  YHQuestionLinked.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHNode;

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionLinked : NSObject

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


@end

NS_ASSUME_NONNULL_END

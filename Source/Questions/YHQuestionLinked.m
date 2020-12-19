//
//  YHQuestionLinked.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionLinked.h"
#import "YHNode.h"

@implementation YHQuestionLinked

#pragma mark --  链表

/**
 * 203 移除链表 元素
 */
+ (YHNode *)removeElement:(YHNode *)head
                  element:(id)element {
    if (!head) {
        return nil;
    }
    if (!element) {
        return head;
    }
    // 虚拟头节点
    YHNode *newHead = [YHNode new];
    YHNode *newTail = newHead;
    while (head) {
        if (![head.element isEqual:element]) {
            newTail.next = head;
            newTail = head;
        }
        head = head.next;
    }
    // 最后一个 要置空
    newTail.next = nil;
    return newHead.next;
}

+ (YHNode *)removeElement1:(YHNode *)head
                  element:(id)element {
    if (!head) {
        return nil;
    }
    
    if (!element) {
        return head;
    }
    YHNode *newTail = nil;
    YHNode *newHead = nil;
    while (head) {
        if (![head.element isEqual:element]) {
            if (!newHead) {
                newHead = head;
                newTail = head;
            } else {
                newTail.next = head;
                newTail = head;
            }
        }
        head = head.next;
    }
    // 最后一个 要置空
    if (newTail) {
        newTail.next = nil;
    }
    return newHead;
}

/**
 * 2. 两数相加
 *  4 -> 5 -> 9->nil
 *  1 -> 0 -> 4->nil
 *  5 -> 5 -> 3-> 1 ->nil
 */
+ (YHNode *)addTwoNumbers:(YHNode *)l1 l2:(YHNode *)l2 {
    if (!l1) {
        return l2;
    }
    YHNode *dummyHead = [YHNode new];
    YHNode *last = dummyHead;
    // 进位值
    int carry = 0;
    while (l1 || l2) {
        int lv1 = l1 ? [l1.element intValue] : 0;
        int lv2 = l2 ? [l2.element intValue] : 0;
        int sum = lv1 + lv2 + carry;
        carry = sum / 10;
        YHNode *n = [YHNode new];
        n.element = @(sum % 10);
        last.next = n;
        last = n;
        if (l1) {
            l1 = l1.next;
        }
        if (l2) {
            l2 = l2.next;
        }
    }
    
    if (carry > 0) {
        YHNode *n = [YHNode new];
        n.element = @(carry);
        last.next = n;
    }
    return dummyHead.next;
}

/**
 * 160 相交链表
 */
+ (YHNode *)getIntersectionNode:(YHNode *)headA
                          headB:(YHNode *)headB {
    if (!headA || !headB) {
        return nil;
    }
    YHNode *curA = headA;
    YHNode *curB = headB;
    
    while (curA != curB) {
        curA = curA ? curA.next: headB;
        curB = curB ? curB.next : headA;
    }
    return curA;
}

/**
 * 86 分割链表
 */
+ (YHNode *)partition:(YHNode *)head x:(int)x {
    
    if (!head) {
        return nil;
    }
    
    YHNode *left = [YHNode new];
    YHNode *leftTail = left;
    YHNode *right = [YHNode new];
    YHNode *rightTail = right;
    while (head) {
        int v = [head.element intValue];
        if (v < x) {
            leftTail.next = head;
            leftTail = head;
        } else {
            rightTail.next = head;
            rightTail = head;
        }
        head = head.next;
    }
    leftTail.next = right.next;
    rightTail.next = nil;
    return left.next;
}
/**
 * 234 回文链表
 * 1> 2>2>1>nil
 * 1> 2>3>2>1>nil
 * 1. 翻转链表 逐个对比
 */
+ (BOOL)isPalindrome:(YHNode *)head {
    if (!head || !head.next) {
        return YES;
    }
    if (!head.next.next) {
        return [head.element isEqual:head.next.element];
    }
    // 找到中间节点
    YHNode *mid = [self middleNode:head];
    // 翻转右半部分
    YHNode *rhead = [self reverseList:mid.next];
    YHNode *lhead = head;
    YHNode *roldHead = rhead;
    BOOL ret = YES;
    while (rhead) {
        if (![rhead.element isEqual:lhead.element]) {
            ret = NO;
            break;
        }
        rhead = rhead.next;
        lhead = lhead.next;
    }
    // 反转
    [self reverseList:roldHead];
    return ret;
}
/**
 * 右边部分链表头结点的前一个节点
 * 1> 2>2>1>ni      第一个2
 * 1> 2>3>2>1>nil   3
 *  快慢指针
 */
+ (YHNode *)middleNode:(YHNode *)head {
    YHNode *fast = head;
    YHNode *slow = head;
    while (fast.next && fast.next.next) {
        fast = fast.next.next;
        slow = slow.next;
    }
    return slow;
}

/**
 * 翻转链表
 * 1>2>3>4>nil
 */
+ (YHNode *)reverseList:(YHNode *)head {
    YHNode *newHead = nil;
    while (head) {
        YHNode *tmp = head.next;
        head.next = newHead;
        newHead = head;
        head = tmp;
    }
    return newHead;
}


@end

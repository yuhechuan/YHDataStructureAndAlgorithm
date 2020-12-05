//
//  YHQuestions.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/3.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestions.h"
#import "YHStack.h"
#import "YHDoubleQueue.h"

@interface YHNode : NSObject

@property (nonatomic, strong) YHNode *next;
@property (nonatomic, strong) id element;

@end

@implementation YHNode

@end

@implementation YHQuestions

#pragma mark --  数组 排序
/**
 * 88合并2个有序数组
 */
+ (NSArray *)merge:(NSArray *)num1 num2:(NSArray *)num2 {
    NSMutableArray *sortArr = [NSMutableArray array];
    [sortArr addObjectsFromArray:num1];
    [sortArr addObjectsFromArray:num2];

    int maxl = (int)num1.count + (int)num2.count;
    int cur = maxl -1;
    int top = (int)num1.count -1;
    int bom = (int)num2.count -1;
    
    while (bom >= 0) {
        if (top >= 0 && [num1[top] intValue] > [num2[bom] intValue]) {
            sortArr[cur--] = num1[top--];
        } else {
            sortArr[cur--] = num2[bom--];
        }
    }
    return sortArr;
}

/**
 *  75 颜色分类
 *  红白蓝 0 1 2
 *  [2,0,1,0,2,1];
 *  [0,0,1,1,2,2];
 *  要求原地排序
 */
+ (void)colorClassify:(NSMutableArray *)num {
    int i = 0;
    int l = 0;
    int r = (int)num.count - 1;
    
    while (i <= r) {
        int v = [num[i] intValue];
        if (v == 0) {
            [self swap:i++ p2:l++ nums:num];
        } else if (v == 1) {
            i ++;
        } else {
            [self swap:i p2:r-- nums:num];
        }
    }
}


+ (void)swap:(int)p1
          p2:(int)p2
        nums:(NSMutableArray *)nums {
    NSObject *tmp = nums[p1];
    nums[p1] = nums[p2];
    nums[p2] = tmp;
}

/**
 * 16 部分排序
 *  [1, 5, 4, 3,2,6,7]
 *  [1,4]
 *  返回 一段无序的序列 排序完成之后 导致 整个有序
 *  返回开始下标和结束下标
 *  逆序对
 *  右边 最后一个逆序对
 *  左边
 */
+ (NSArray *)subSort:(NSArray *)nums {
    if (nums.count == 0 || nums.count > 10000) {
        return @[@(-1),@(-1)];
    }
    // 从左往右 找到一个逆序对
    int indexr = -1;
    int maxv = [nums[0] intValue];
    int length = (int)nums.count;
    for (int i = 1; i < length; i ++) {
        int v = [nums[i] intValue];
        if (v >= maxv) {
            maxv = v;
        } else {
            indexr = i;
        }
    }
    
    if (indexr == -1) {
        return @[@(-1),@(-1)];
    }
    
    int indexl = -1;
    int minv = [nums[length -1] intValue];
    for (int i = length - 2; i >= 0; i --) {
        int v = [nums[i] intValue];
        if (v <= minv) {
            minv = v;
        } else {
            indexl = i;
        }
    }
    return @[@(indexl),@(indexr)];
}
/**
 *  977 有序数组的平方
 */
+ (NSArray *)sortedSquares:(NSArray *)nums {
    
    int l = 0;
    int r = (int)nums.count -1;
    int i = r;
    NSMutableArray *sortArr = [NSMutableArray arrayWithArray:nums];
    while (l <= r) {
        int lv = [nums[l] intValue];
        int rv = [nums[r] intValue];
        int sqlv = lv *lv;
        int sqrv = rv *rv;
        if (lv + rv < 0) {
            sortArr[i--] = @(sqlv);
            l ++;
        } else {
            sortArr[i--] = @(sqrv);
            r --;
        }
    }
    return sortArr;
}

+ (NSArray *)sortedSquares1:(NSArray *)nums {
    
    int l = 0;
    int r = (int)nums.count -1;
    int i = r;
    NSMutableArray *sortArr = [NSMutableArray arrayWithArray:nums];
    while (l <= r) {
        int lv = [nums[l] intValue];
        int rv = [nums[r] intValue];
        int sqlv = lv *lv;
        int sqrv = rv *rv;
        if (lv > 0) {
            sortArr[i--] = @(sqrv);
            r --;
            continue;
        }
        
        if (sqlv > sqrv) {
            sortArr[i--] = @(sqlv);
            l ++;
        } else {
            sortArr[i--] = @(sqrv);
            r --;
        }
    }
    return sortArr;
}

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

#pragma mark -- 栈、队列
/**
 * 用栈解决 234 回文链表
 *  对称问题一般可以用到栈
 */
+ (BOOL)isPalindromeStack:(YHNode *)head {
    if (!head || !head.next) {
        return YES;
    }
    if (!head.next.next) {
        return [head.element isEqual:head.next.element];
    }
    // 找到中间节点
    YHNode *mid = [self middleNode:head];
    YHNode *right = mid.next;
    YHStack *stack = [[YHStack alloc]init];
    while (right) {
        [stack push:right];
        right = right.next;
    }
    YHNode *nowHead = head;
    while (![stack isEmpty]) {
        YHNode *n = [stack pop];
        if (![n.element isEqual:nowHead.element]) {
            return NO;
        }
        nowHead = nowHead.next;
    }
    return YES;
}

/**
 * 155. 最小栈
 * 设计一个支持 push ，pop ，top 操作，并能在常数时间内检索到最小元素的栈。
 * push(x) —— 将元素 x 推入栈中。
 * pop() —— 删除栈顶的元素。
 * top() —— 获取栈顶元素。
 * getMin() —— 检索栈中的最小元素。
 */
 //  可转移至 YHMinStack 或 YHMinNodeStack 实现

/**
 * 239. 滑动窗口最大值
 * 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。
 * 返回滑动窗口中的最大值。
 * 你能在线性时间复杂度内解决此题吗？
 *  输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 * 输出: [3,3,5,5,6,7]
 *  n - (k - 1)    k-1  不可以作为滑动窗口的第一位  所以返回 数量为 n - (k - 1)
 * 解释:
 */
// 双端队列
+ (NSArray *)maxSlidingWindow:(NSArray *)nums
                            k:(int)k {
    if (!nums || nums.count == 0 || k < 1) {
        return @[];
    }
    if (k == 1) {
        return nums;
    }
    NSMutableArray *max = [NSMutableArray arrayWithCapacity:nums.count - k + 1];
    // 创建一个双端 队列
    YHDoubleQueue *queue = [[YHDoubleQueue alloc]init];
    for (int i = 0; i < nums.count; i ++) {
        
        // 检查队列里面的 值是否小于 单前值 如果小于 出队
        while (![queue isEmpty] && [nums[i] intValue] >= [nums[[[queue rear] intValue]] intValue]) {
            [queue deQueueRear];
        }
        // 入队当前索引
        [queue enQueueRear:@(i)];
        
        // 检查w索引是否合法
        int w = i -k + 1;
        if (w < 0) continue;
        
        
        // 如果头部索引 不合法  队头出队
        if ([[queue front] intValue] < w) {
            [queue deQueueFront];
        }
        // 拿到合法的队头就是 当前队头即为窗口最大值
        [max addObject:nums[[[queue front] intValue]]];
    }
    return max;
}

@end



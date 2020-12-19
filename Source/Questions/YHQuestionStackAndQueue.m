//
//  YHQuestionStackAndQueue.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionStackAndQueue.h"
#import "YHNode.h"
#import "YHDoubleQueue.h"
#import "YHStack.h"
#import "YHBNote.h"

@implementation YHQuestionStackAndQueue

#pragma mark -- 栈、队列

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
// 单调队列
+ (NSArray *)maxSlidingWindow1:(NSArray *)nums
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

/**
 * 简单粗暴 效率很高
 */
+ (NSArray *)maxSlidingWindow:(NSArray *)nums
                            k:(int)k {
    if (!nums || nums.count == 0 || k < 1) {
        return @[];
    }
    if (k == 1) {
        return nums;
    }
    int length = (int)nums.count - k + 1;
    NSMutableArray *max = [NSMutableArray arrayWithCapacity:length];
    int maxIndex = [self maxIndex:nums begin:0 end:k -1];
    
    for (int li = 0; li < length; li ++) {
        int ri = li + k - 1;
        if (maxIndex < li) {
            maxIndex = [self maxIndex:nums begin:li end:ri];
        } else if ([nums[ri] intValue] >= [nums[maxIndex] intValue]) {
            maxIndex = ri;
        }
        max[li] = nums[maxIndex];
    }
    return max;
}
/**
 * 获取一定范围内的  最大值
 */
+ (int)maxIndex:(NSArray *)nums
          begin:(int)begin
            end:(int)end {
    int maxIndex = begin;
    for (int i = begin + 1; i <= end; i ++) {
        if ([nums[i] intValue] >= [nums[maxIndex] intValue]) {
            maxIndex = i;
        }
    }
    return maxIndex;
}


/**
 * 654 最大二叉树  根节点是整棵树 最大的节点
 * 返回二叉树的根节点
 * [3,2,1,6,0,5]
 */
+ (YHBNote *)constructMaximumBinaryTree:(NSArray *)nums {
    return [self findRoot:nums left:0 right:(int)nums.count];
}

+ (YHBNote *)findRoot:(NSArray *)nums
                 left:(int)left
                right:(int)right {
    if (left == right) {
        return nil;
    }
    int maxIndex = left;
    for (int i = left + 1; i < right; i ++) {
        if ([nums[i] intValue] > [nums[maxIndex] intValue]) {
            maxIndex = i;
        }
    }
    YHBNote *node = [YHBNote new];
    node->element = nums[maxIndex];
    node->left = [self findRoot:nums left:left right:maxIndex];
    node->right = [self findRoot:nums left:maxIndex + 1 right:right];
    return node;
}
/**
 * 返回数组每个数的 根节点  数组
 *  利用栈  里面元素单调 递减 越往上 数据越小
 */
+ (NSArray *)constructMaximumBinaryTreeRoots:(NSArray *)nums {
    if (!nums || nums.count == 0) {
        return @[];
    }
    //  从栈底到栈顶 单调递减的栈
    YHStack *stack = [[YHStack alloc]init];
    
    int length = (int)nums.count;
    NSMutableArray *left = [NSMutableArray arrayWithCapacity:length];
    NSMutableArray *right = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [left addObject:@(-1)];
        [right addObject:@(-1)];
    }
    
    for (int i = 0; i < length; i ++) {
        while (![stack isEmpty] && [nums[i] intValue] > [nums[[[stack peek] intValue]] intValue]) {
            int pop = [[stack pop] intValue];
            right[pop] = @(i);
        }
        left[i] = [stack isEmpty] ? @(-1) : [stack peek];
        [stack push:@(i)];
    }
    for (int i = 0; i < length; i++) {
        int lindex = [left[i] intValue];
        int rindex = [right[i] intValue];
        NSNumber *result = nil;
        if (lindex >=0 && rindex >= 0) {
            result = @(MIN([nums[lindex] intValue],[nums[rindex] intValue]));
        } else if (lindex < 0 &&  rindex >= 0) {
            result = nums[rindex];
        } else if (rindex < 0 &&  lindex >= 0) {
            result = nums[lindex];
        } else {
            result = @(-1);
        }
        left[i] = result;
    }
    return left;
}

/**
 *  739 每日温度
 *   [73, 74, 75, 71, 69, 72, 76, 73]
 */

+ (NSArray *)dailyTemperatures:(NSArray *)T {
    if (!T || T.count == 0) {
        return @[];
    }
    int length = (int)T.count;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [values addObject:@(0)];
    }
    
    for (int i = length -2; i>= 0; i --) {
        int j = i + 1;
        while (YES) {
            int iv = [T[i] intValue];
            int jv = [T[j] intValue];
            if (iv < jv) {
                values[i] = @(j - i);
                break;
            } else if ([values[j] intValue] == 0) {
                values[i] = @(0);
                break;
            }
            j = j + [values[j] intValue];
        }
    }
    return values;
}

+ (NSArray *)dailyTemperatures1:(NSArray *)T {
    if (!T || T.count == 0) {
        return @[];
    }
    YHStack *stack = [[YHStack alloc]init];
    int length = (int)T.count;
    NSMutableArray *right = [NSMutableArray arrayWithCapacity:length];
    for (int i = 0; i < length; i++) {
        [right addObject:@(0)];
    }
    
    for (int i = 0; i < length; i ++) {
        // 第一个比我大的  不能写=
        while (![stack isEmpty] && [T[i] intValue] > [T[[[stack peek] intValue]] intValue]) {
            int pop = [[stack pop] intValue];
            right[pop] = @(i - pop);
        }
        [stack push:@(i)];
    }
    return right;
}


@end

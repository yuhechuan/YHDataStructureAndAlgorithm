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
#import "YHBNote.h"

YHBNote *_preNode;
YHBNote *_fristNode;
YHBNote *_secondNode;

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

#pragma mark -- 字符串

/**
 * 01.09.字符串轮转
 *  https://leetcode-cn.com/problems/string-rotation-lcci/
 *  旋转词
 *  back
 *  ackb
 *  kbac
 */
+ (BOOL)isFlipedString:(NSString *)s1 s2:(NSString *)s2 {
    if (!s1 || !s2) {
        return NO;
    }
    
    if (s1.length != s2.length) {
        return NO;
    }
    NSString *newString = [NSString stringWithFormat:@"%@%@",s1,s1];
    return [newString containsString:s2];
}

/**
 * 572 另一个树的子树
 */
+ (BOOL)isSubtree:(YHBNote *)s t:(YHBNote *)t {
    // 序列化
    NSString *sstr = [self postorder:s];
    NSString *tstr = [self postorder:t];
    NSLog(@"1.====%@",sstr);
    NSLog(@"2.====%@",tstr);
    return [sstr containsString:tstr];
}

/**
 * 利用后续遍历的方式进行序列化
 */
+ (NSString *)postorder:(YHBNote *)note {
    if (!note) {
        return @"";
    }
    NSMutableString *sb = [NSMutableString string];
    [self postorder:note sb:sb];
    return sb;
}

+ (void)postorder:(YHBNote *)note sb:(NSMutableString *)sb {
    if (note->left) {
        [self postorder:note->left sb:sb];
    } else {
        [sb appendString:@"#!"];
    }
    if (note->right) {
        [self postorder:note->right sb:sb];
    } else {
        [sb appendString:@"#!"];
    }
    
    [sb appendString:note->element];
    [sb appendString:@"!"];
}

/**
 * 242. 有效的字母异位词
 */
+ (BOOL)isAnagram:(NSString *)s t:(NSString *)t {
    if (!s || !t) {
        return NO;
    }
    if (s.length != t.length) {
        return NO;
    }
    int lenth = (int)s.length;
    NSMutableArray *chars = [NSMutableArray arrayWithCapacity:26];
    for (int i = 0; i < 26; i ++) {
        [chars addObject:@(0)];
    }
    for (int i = 0; i < lenth; i ++) {
        int index = [s characterAtIndex:i] - 'a';
        chars[index] = @([chars[index] intValue] + 1);
    }
    
    for (int i = 0; i < lenth; i ++) {
        int index = [t characterAtIndex:i] - 'a';
        int v =  [chars[index] intValue] - 1;
        if (v < 0) {
            return NO;
        }
        chars[index] = @(v);
    }
    return YES;
}

/**
 * 151.翻转字符串里面的单词
 *  去除多余空格
 *  hello world!
 *  world! hello
 */
+ (NSString *)reverseWords:(NSString *)s {
    if (!s) {
        return nil;
    }
    // 去除多余空格
    int length = (int)s.length;
    char chars[length];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],length);
    
    int cur = 0;      // 当前用来存放字符的位置
    BOOL space = YES; // -1 是空格 处理前面空格
    for (int i = 0; i < length; i ++) {
        // 非空格字符
        if (chars[i] != ' ') {
            chars[cur ++] = chars[i];
            space = NO;
        } else if (space == NO) {
            chars[cur ++] = ' ';
            space = YES;
        }
    }
    
    int len = space ? cur - 1 : cur;
    // 全部逆序
    [self reversedOrder:chars li:0 ri:len];

    // 分别逆序
    int preIndex = -1; // 假想的哨兵
    for (int i = 0; i < len; i++) {
        if (chars[i] == ' ') {
            [self reversedOrder:chars li:preIndex + 1 ri:i];
            preIndex = i;
        }
    }
    [self reversedOrder:chars li:preIndex + 1 ri:len];
    
    // 组装字符串
    NSMutableString *mustr = [NSMutableString string];
    for (int i = 0; i < len; i++) {
        [mustr appendFormat:@"%c",chars[i] ];
    }
    return mustr;
}

+ (void)reversedOrder:(char [])chars
                li:(int)li
                ri:(int)ri {
    ri--;
    while (li < ri) {
        char tmp = chars[li];
        chars[li] = chars[ri];
        chars[ri] = tmp;
        li ++;
        ri --;
    }
}

/**
 * 3. 无重复字符的最长子串
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 * pwwkew
 * 单字节字符
 */
+ (int)lengthOfLongestSubstring:(NSString *)s {
    if (!s || s.length ==0) {
        return 0;
    }
    int length = (int)s.length;
    char chars[length];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],length);
    
    // 0位置特殊处理
    int size = 128;
    int *map = (int *)malloc(size * sizeof(int));
    
    for (int i = 0; i < size; i ++) {
        map[i] = -1;
    }
    
    // 用于保存字符上次出现的位置
    map[chars[0]] = 0;
    
    // 以i减一 结尾的 最长子串 开始位置
    int li = 0;
    int max = 1;
    for (int i = 1; i < length; i++) {
        // 上一次出现的位置
        // 如果k字符不存在 啧 pi为最小-1
        int index = chars[i] ;
        int pi = map[index];
        if (li <= pi) {
            li = pi + 1;
        }
        map[index] = i;
        max = MAX(max, i - li + 1);
    }
    free(map);
    return max;
}

#pragma mark -- 动态规划
/**
 * 剑指 Offer 47. 礼物的最大价值
 */
// 二维数组 可以优化成一位数组
+ (int)maxValue1:(NSArray *)grid  {
    int m = (int)grid.count;
    int n = (int)[grid[0] count];
    int dp[m][n];
    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
            int v = [grid[i][j] intValue];
            if (i == 0 && j == 0) {
                dp[i][j] = v;
            } else if (i == 0) {
                dp[i][j] = dp[i][j-1] + v;
            } else if (j == 0) {
                dp[i][j] = dp[i-1][j] + v;
            } else {
                dp[i][j] = MAX(dp[i -1][j], dp[i][j -1]) + v;
            }
        }
    }
    return dp[m -1][n-1];
}

/**
 * 优化成一维 数组
 */
+ (int)maxValue:(NSArray *)grid  {
    int m = (int)grid.count;
    int n = (int)[grid[0] count];
    int dp[m];
    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
            int v = [grid[i][j] intValue];
            if (i == 0 && j == 0) {
                dp[j] = v;
            } else if (i == 0) {
                dp[j] = dp[j -1] + v;
            } else if (j == 0) {
                dp[j] = dp[j] + v;
            } else {
                dp[j] = MAX(dp[j-1], dp[j]) + v;
            }
        }
    }
    return dp[m -1];
}

/**
 * 121 买卖股票的最佳时间
 */
+ (int)maxProfit:(NSArray *)prices {
    int min = [prices[0] intValue];
    int maxv = 0;
    int length = (int)prices.count;
    for (int i = 1; i < length; i ++) {
        int v = [prices[i] intValue];
        min = MIN(min, v);
        maxv = MAX(maxv, v -min);
    }
    if (maxv < 0) {
        maxv = 0;
    }
    return maxv;
}

// 动态规划 想法
+ (int)maxProfit1:(NSArray *)prices {
    return 0;
}
/**
 * 72.编辑距离 从word1 转成word2
 * 删除一个字符 、插入一个字符、替换一个字符
 * horse ---> ros
 * h --> r  替换    r  删除  e  删除 共三步
 * mice --->  arise
 * dp[i][j] 表示 0-i  0-j 变换所需的最小步数
 */
// 一维数组
+ (int)minDistance:(NSString *)word1
             word2:(NSString *)word2 {
    int m = (int)word1.length + 1;
    int n = (int)word2.length + 1;
    int dp[n];
    for (int i = 0; i < m; i ++) {
        int cur = 0;
        for (int j = 0; j < n; j ++) {
            int lt = cur;
            cur = dp[j];
            if (i == 0 && j == 0) {
                dp[j] = 0;
            } else if (i == 0) {
                dp[j] = j;
            } else if (j == 0) {
                dp[j] = i;
            } else {
                int v1 = dp[j] + 1;
                int v2 = dp[j-1] + 1;
                char c1 = [word1 characterAtIndex:i - 1];
                char c2 = [word2 characterAtIndex:j - 1];
                int v3 = c1 == c2 ?  lt :lt + 1;
                dp[j] = MIN(v3, MIN(v1, v2));
            }
        }
    }
    return dp[n -1];
}
// 二维数组
+ (int)minDistance1:(NSString *)word1
             word2:(NSString *)word2 {
    /*
     先删除一个字符 再插入
     1.dp[i][j] = dp[i-1][j] + 1;
     2.dp[i][j] = dp[i][j-1] + 1;
     3.最后一个字符相等
     dp[i][j] = dp[i-1][j-1];
     4.最后一个字符不等
     dp[i][j] = dp[i-1][j-1] + 1;

     */
    int m = (int)word1.length + 1;
    int n = (int)word2.length + 1;
    int dp[m][n];
    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
            if (i == 0 && j == 0) {
                dp[i][j] = 0;
            } else if (i == 0) {
                dp[i][j] = j;
            } else if (j == 0) {
                dp[i][j] = i;
            } else {
                int v1 = dp[i-1][j] + 1;
                int v2 = dp[i][j-1] + 1;
                char c1 = [word1 characterAtIndex:i - 1];
                char c2 = [word2 characterAtIndex:j - 1];
                int v3 = c1 == c2 ?  dp[i-1][j-1] :dp[i-1][j-1] + 1;
                dp[i][j] = MIN(v3, MIN(v1, v2));
            }
        }
    }
    return dp[m - 1][n -1];
}

/**
 * 5,最长回文子串
 * 暴力法  n^3
 * 时间复杂度 n^2
 * 空间复杂度 0(n^2)
 */
+ (NSString *)longestPalindrome1:(NSString *)s {
    /**
     dp[i][j] 表示  [i,j]子串是否是回文串
     */
    int n = (int)s.length;
    if (!s || n == 0 || n == 1) {
        return s;
    }
    
    int dp[n][n];
    int maxLength = 1;
    int maxIndex = 0;
    
    char chars[n];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],n);
    
    for (int i = n; i >= 0; i --) {
        for (int j = i; j < n; j ++) {
            int length = j - i + 1;
            int ret = chars[i] == chars[j] && (length <= 2 || dp[i + 1][j -1]);
            if (ret && length > maxLength) {
                maxLength = length;
                maxIndex = i;
            }
            dp[i][j] = ret;
        }
    }
    NSString *sub = [s substringWithRange:NSMakeRange(maxIndex, maxLength)];
    return sub;
}
/**
 * 中心扩散法
 * 扩展中心的数量 n + (n -1) = 2n -1;
 *  时间复杂度 n^2
 *  空间复杂度 0(1)
 */
+ (NSString *)longestPalindrome2:(NSString *)s {
    int n = (int)s.length;
    if (!s || n <= 1) {
        return s;
    }
    
    // asava
    int maxLength = 1;
    int maxIndex = 0;
    for (int i = n -2; n > 0; i --) {
        // 如果回文串的长度的一半 大于 当前索引 可以退出
        if (maxLength / 2 > i) {
            break;
        }
        
        int len1 = [self palindromeSubstring:s l:i -1 r:i+1];
        int len2 = [self palindromeSubstring:s l:i r:i+1];
        len1 = MAX(len1, len2);
        if (len1 > maxLength) {
            maxLength = len1;
            maxIndex = i - ((len1 - 1) >>1);
        }
    }
    // 特殊处理 一下
    char c1 = [s characterAtIndex:0];
    char c2 = [s characterAtIndex:1];
    if (c1 == c2 && maxLength < 2) {
        maxLength = 2;
        maxIndex = 0;
    }
    NSString *sub = [s substringWithRange:NSMakeRange(maxIndex, maxLength)];
    return sub;
}
/**
 * 扩展中心 优化 n -->n^2
 */
+ (NSString *)longestPalindrome3:(NSString *)s {
    int n = (int)s.length;
    if (!s || n <= 1) {
        return s;
    }
    int maxLength = 1;
    int maxIndex = 0;
    
    char chars[n];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],n);
    int i = 0;
    while (i < n) {
        int r = i;
        while (++r < n && chars[i] == chars[r]) {};
        int l = i -1;
        i = r;
        while (l >= 0 && r < n && chars[l] == chars[r]) {
            l--;
            r++;
        }
        int len = r - ++l;
        if (len > maxLength) {
            maxLength = len;
            maxIndex = l;
        }
    }
    NSString *sub = [s substringWithRange:NSMakeRange(maxIndex, maxLength)];
    return sub;
}

/**
 * 马拉车算法Manacher
 */
+ (NSString *)longestPalindrome:(NSString *)s {
    int n = (int)s.length;
    if (!s || n <= 1) {
        return s;
    }
    int maxLength = 1;
    int maxIndex = 0;
    
    // 预处理字符串
    int m = (n << 1) + 3;
    char mchars[m];
    mchars[0] = '^';
    mchars[1] = '#';
    mchars[m -1] = '$';
    
    for (int i = 0; i < n; i ++) {
        int idx = (i + 1) << 1;
        mchars[idx] = [s characterAtIndex:i];
        mchars[idx + 1] = '#';
    }
    
    // 0,1 特殊字符 2好位置是1 两边都是#
    int mArr[m];
    for (int i = 0; i < m; i ++) {
        mArr[i] = 0;
    }
    
    int r = 1;
    int c = 1;
    for (int i = 2; i < m -2; i ++) {
        if (r > i) {
            int li = (c <<1) -i;
            mArr[i] = i + mArr[li] <= r ? mArr[li] :r - i;
        }
        
        // 以i 为中心 左右扩展
        while (mchars[i + mArr[i] + 1] == mchars[i - mArr[i] - 1]) {
            mArr[i] =  mArr[i] + 1;
        }
        
        // 更新c 跟r
        if (i + mArr[i] > r) {
            c = i;
            r = i + mArr[i];
        }
        if (mArr[i] > maxLength) {
            maxLength = mArr[i];
            maxIndex = i;
        }
    }
    int begin = (maxIndex - maxLength) >> 1;
    NSString *sub = [s substringWithRange:NSMakeRange(begin, maxLength)];
    return sub;
}



// 是否是回文串
+ (int)palindromeSubstring:(NSString *)s
                           l:(int)l
                           r:(int)r {
    int n = (int)s.length;
    char chars[n];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],n);
    while (l >= 0 && r < n && chars[l] == chars[r]) {
        l--;
        r++;
    }
    return r -l -1;
};


#pragma mark -- 二叉树
/**
 * 236 二叉树的最近公共祖先
 */
+ (YHBNote *)lowestCommonAncestor:(YHBNote *)root
                                p:(YHBNote *)p
                                q:(YHBNote *)q {
    if (!root || p == root || q == root) {
        return root;
    }
    YHBNote *left = [self lowestCommonAncestor:root->left p:p q:q];
    YHBNote *right = [self lowestCommonAncestor:root->right p:p q:q];
    
    if (left && right) {
        return root;
    }
    return left ? left : right;
}

/**
 * 99 恢复二叉搜索树
 *  二叉搜搜数 中序遍历是升序的
 *  时间O(n)
 *  空间O(h) 输的高度
 */
+ (void)recoverTree:(YHBNote *)root {
    [self findMorrisWrongNodes:root];
    id tmp = _fristNode->element;
    _fristNode->element = _secondNode->element;
    _secondNode->element = tmp;
}

/**
 * 二叉树的Morris遍历 可以达到 时间复杂度O(n)  空间复杂度O(1)
 * 每个节点遍历2次 O(2n)
 */
+ (void)findMorrisWrongNodes:(YHBNote *)root {
    if (!root) {
        return;
    }
    
    YHBNote *N =root;
    while (N) {
        if (N->left) {
            // 找到前驱节点
            YHBNote *pre = N->left;
            while (pre->right && pre->right != N) {
                pre = pre->right;
            }
            
            if (!pre->right) {
                pre->right = N;
                N = N->left;
            } else {
                // 第二次 访问
                [self findNode:root];
                pre->right = nil;
                N = N->right;
            }
        } else {
            [self findNode:root];
            N = N->right;
        }
    }
    
}

/**
 * 获取前驱节点
 */

+ (void)findNode:(YHBNote *)node {
    if (_preNode && [self compare:_preNode->element v2:node->element]) {
        _secondNode = node;
        if (_fristNode) {
            return;
        }
        _fristNode = _preNode;
    }
    _preNode = node;
}


/**
 * 中序遍历 查找逆序对
 */
+ (void)findWrongNodes:(YHBNote *)root {
    if (!root) {
        return;
    }
    [self findWrongNodes:root->left];
    [self findNode:root];
    [self findWrongNodes:root->right];
}

+ (int)compare:(id)v1 v2:(id)v2 {
    int a = [v1 intValue];
    int b = [v2 intValue];
    return a > b;
}

/**
 * 333.最大BST子树
 * 包含所有的子类
 * 返回节点数量
 */
+ (int)largestBSTSubtree:(YHBNote *)root {
    if (!root) {
        return 0;
    }
    
    if ([self isBST:root]) {
        return [self nodeCounts:root];
    }
    
    return MAX([self largestBSTSubtree:root->left], [self largestBSTSubtree:root->right]);
}

+ (BOOL)isBST:(YHBNote *)root {
    return YES;
}

+ (int)nodeCounts:(YHBNote *)root {
    return 0;
}
@end



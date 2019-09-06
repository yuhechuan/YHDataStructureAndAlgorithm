//
//  YHInterview.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/7/1.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHInterview.h"

@implementation YHInterview

/*
 异或^
 0^1 = 1;
 1^0 = 1;
 
 111
 111

 0^0 = 0;
 1^1 = 0;
 */

+ (NSInteger)singleNumber:(NSArray *)nums {
    NSInteger count = nums.count;
    NSInteger num = 0;
    for (int i = 0; i < count; i ++) {
        num = num ^[nums[i] integerValue];
    }
    return num;
}

+ (NSInteger)majorityElement1:(NSArray *)nums {
    NSInteger count = nums.count;
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    for (int i = 0; i < count; i ++) {
        
        if (d[nums[i]]) {
            d[nums[i]] = @([nums[i] integerValue] +1);
        } else {
            d[nums[i]] = @(1);
        }
    }
    __block NSInteger max = -1;
    __block NSInteger keyMax = -1;
    [d enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj integerValue] > max) {
            max = [obj integerValue];
            keyMax = [key integerValue];
        }
    }];
    return keyMax;
}

/*
 摩尔投票法
 */

+ (NSInteger)majorityElement:(NSArray *)nums {
    NSInteger len = nums.count;
    NSInteger count = 0;
    NSInteger first = [nums[0] integerValue];
    for (int i = 0; i < len; i ++) {
        NSInteger current = [nums[i] integerValue];
        if (first == current) {
            count ++;
        } else {
            count --;
            if (count == 0) {
                first = current;
                count ++;
            }
        }
    }
    return first;
}

/*
 搜索二维矩阵 II
 */
+ (BOOL)searchMatrix:(NSArray <NSArray *>*)matrix
              target:(NSInteger)target {
    NSInteger m = matrix.count -1;
    NSInteger n = 0;
    NSInteger nmax = [matrix[0] count];
    
    while (m >= 0 && n <nmax) {
        NSInteger current = [matrix[m][n] integerValue];
        if (current == target) {
            return YES;
        } else if (current >target) {
            m--;
        } else {
            n++;
        }
    }
    return NO;
}

/*
 合并两个有序数组
 */

+ (NSArray *)merge1:(NSArray *)nums1
             nums2:(NSArray *)nums2 {
    
    NSInteger a1 = 0;
    NSInteger a2 = 0;
    
    NSInteger n = nums1.count;
    NSInteger m = nums2.count;
    
    NSMutableArray *arr = [NSMutableArray array];
    
    while (a1 < n && a2 < m) {
        NSInteger num1 = [nums1[a1] integerValue];
        NSInteger num2 = [nums2[a2] integerValue];
        
        if (num1 < num2) {
            [arr addObject:@(num1)];
            a1 ++;
        } else if (num1 > num2) {
            [arr addObject:@(num2)];
            a2 ++;
        } else  {
            a1 ++;
            a2 ++;
            [arr addObject:@(num1)];
            [arr addObject:@(num2)];
        }
    }
    
    while (a1 < n) {
        [arr addObject:nums1[a1]];
        a1 ++;
    }

    while (a2 < m) {
        [arr addObject:nums2[a2]];
        a2 ++;
    }

    return arr;
}

+ (NSArray *)merge:(NSMutableArray *)nums1
             nums2:(NSArray *)nums2 {
    
    NSInteger m = nums1.count;
    NSInteger n = nums2.count;
    NSInteger a1 = m - n -1;
    NSInteger a2 = n -1;
    NSInteger tail = m - 1;

    while (a1 >= 0 && a2 >= 0) {
        NSInteger num1 = [nums1[a1] integerValue];
        NSInteger num2 = [nums2[a2] integerValue];
        
        if (num1 > num2) {
            nums1[tail] = @(num1);
            a1 --;
            tail--;
        } else if (num1 < num2) {
            nums1[tail] = @(num2);
            a2 --;
            tail--;
        } else  {
            nums1[tail] = @(num1);
            tail--;
            nums1[tail] = @(num2);
            tail--;
            a1 --;
            a2 --;
        }
    }
    while (a2 >= 0) {
        nums1[tail] = nums2[a2];
        a2 --;
        tail--;
    }
    return nums1;
}


/*
 鸡蛋掉落 K 个鸡蛋 N层楼
 见图
 */

+ (NSInteger)superEggDrop2:(NSInteger)K
                        N:(NSInteger)N {
    
    int step = 1;// 默认最少走一步
    while ([self maxFloor:K step:step] < N) { // 如果不能兼顾所有楼层 则增加测试次数
        step ++;
    }
    return step;
}

// 最高检测的层数

+ (NSInteger)maxFloor:(NSInteger)eggs
                 step:(NSInteger)step {
    if (eggs == 1 || step == 1) {// 当只有一个鸡蛋的时候 有几步就能检测几楼层  当只有一步 也只能测试一个楼层
        return step;
    }
    
    // 如果鸡蛋碎了 鸡蛋少了一个 步数也会少一次
    NSInteger left = [self maxFloor:eggs -1 step:step -1];
    
    // 如果鸡蛋没碎 鸡蛋不会少 步数会少一次
    NSInteger right = [self maxFloor:eggs step:step - 1];
    
    // +1 是检测了一层楼
    return left + 1 +right;
}

// 非递归方式
+ (NSInteger)superEggDrop:(NSInteger)K
                        N:(NSInteger)N {
    
    if (K == 1 || N == 1) {
        return N;
    }
    
    NSMutableArray *dp = [NSMutableArray array];
    for (int i = 0; i <= K; i++) {
        NSMutableArray *b = [NSMutableArray array];
        for (int j = 0; j<= N; j ++) {
            [b addObject:@(0)];
        }
        [dp addObject:b];
    }
    
    for (int m = 1; m <= N; m++) {
        for (int k = 1; k<= K; k ++) {
            dp[k][m] = @([dp[k][m - 1] integerValue] + [dp[k - 1][m - 1] integerValue] + 1);
            if ([dp[k][m] integerValue] >= N) {
                return m;
            }
        }
    }
    return N;
}

/*
 乘积最大子序列
 */

+ (NSInteger)maxProduct:(NSArray *)nums {
    NSInteger length = nums.count;
    NSInteger max = INT_MIN;
    NSInteger imax = 1;
    NSInteger imin = 1;
    
    for (int i = 0; i < length; i ++) {
        NSInteger current = [nums[i] integerValue];
        if (current < 0) {
            imax = imax ^imin;
            imin = imax ^imin;
            imax = imax ^imin;
        }
        
        imax = MAX(current, imax *current);
        imin = MIN(current, imin *current);
        max = MAX(max, imax);
    }
    return max;
}

/*
 判断是否是回文串
 */

+ (BOOL)isPalindrome:(NSString *)string {
    
    NSInteger left = 0;
    NSInteger right = string.length -1;
    while (left < right) {
        // 跳过别的字符
        while (left < right && ![self isLawful:[string substringWithRange:NSMakeRange(left, 1)]]) {
            left ++;
        }
        
        while (left < right && ![self isLawful:[string substringWithRange:NSMakeRange(right, 1)]]) {
            right --;
        }
        
        NSString *l = [string substringWithRange:NSMakeRange(left, 1)];
        NSString *r = [string substringWithRange:NSMakeRange(right, 1)];
        
        l = [l lowercaseString];
        r = [r lowercaseString];
        if (![l isEqualToString:r]) return NO;
        
        left++;
        right--;
    }
    
    return YES;
}

+ (BOOL)isLawful:(NSString *)c {
    NSString * regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:c];
    return isMatch;
}

/*
 分割回文串
 */

+ (NSArray *)partition:(NSString *)string {
    NSMutableArray *tmp = [NSMutableArray array];
    NSInteger len = string.length;
    
    for (int i = 0; i < len; i ++) {
        NSString *l = [string substringWithRange:NSMakeRange(i, 1)];
        [tmp addObject:l];
        if (tmp.count > 1) {
            NSString *merge = [tmp componentsJoinedByString:@""];
            if ([self isPalindrome:merge]) {
                [tmp addObject:merge];
            }
        }
    }
    return nil;
}


/*
 LeetCode（78）：子集
 */

+ (NSArray <NSArray *>*)subsets:(NSArray *)arr {
    NSMutableArray *subs = [NSMutableArray array];
    [subs addObject:[NSMutableArray array]];
    
    int count = (int)arr.count;
    for (int i = 0; i < count; i++) {
        // 快照
        NSMutableArray *photo = [NSMutableArray array];
        for (NSMutableArray *b in subs) {
            [photo addObject:[NSMutableArray arrayWithArray:b]]; //深拷贝
        }
        
        for (NSMutableArray *a in subs) {
            [a addObject:arr[i]];
        }
        
        // 合并两个
        [subs addObjectsFromArray:photo];
    }
    return subs.copy;
}

/*
 LeetCode（70）：爬楼
 */

+ (NSInteger)climbStairs:(NSInteger)n {
    
    if (n == 1 || n == 2) {
        return n;
    }
    //
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < n; i ++) {
        arr[i] = @(0);
    }
    
    arr[0] = @(1);
    arr[1] = @(2);
    
    for (int i = 2; i < n; i ++) {
        arr[i] = @([arr[i-1] integerValue] + [arr[i -2] integerValue]);
    }
    
    return [arr[n-1] integerValue];
}

/*
 f斐波那契额
 */

+ (int)fibnq:(int)n {
    if (n < 2) {
        return n;
    }
    int a = 0, b = 1;
    for (int i = 2; i < n; i ++) {
        b = a + b; // 第x3位
        a = b - a; // 第二位
    }
    return b;
}

/*
 反转一个链表
 c  c
 5->4->3->2->1->nil
 
 n
 5
 */

+ (YHNote *)reverseList:(YHNote *)linkNode {
    YHNote *newHead = nil;
    YHNote *curHead = linkNode;
    while (curHead) {
        YHNote *tmp = curHead->next;
        curHead->next = newHead;
        newHead = curHead;
        curHead = tmp;
    }
    return newHead;
}

/*
  反转一个链表的另一种实现方式
 1->2->3->4->5->6->7->8->null, K = 3
 
*/

+ (YHNote *)reverseListTwo:(YHNote *)linkNode
                  groupNum:(int)groupNum {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    int i = 0;
    while (linkNode) {
        dict[@(i)] = linkNode;
        linkNode = linkNode->next;
        i ++;
    }
    
    // 按组拆分
    i --;
    YHNote *newNode = nil;
    
    while (i > 0) {
        YHNote *noder = dict[@(i)];
        if (noder->next) {
            noder->next = nil;
        }
    
        int tmp = i - (groupNum -1);
        int j = tmp > 0 ? tmp : 0;
        YHNote *node = dict[@(j)];
        YHNote *n = tmp > 0 ? [self reverseList:node] : node;
        newNode = [self reverseListThree:newNode B:n];
        i = i- groupNum;
    }
    
   
    return newNode;
}

+ (YHNote *)reverseListThree:(YHNote *)A B:(YHNote *)B {
    if (A == nil) {
        A = B;
        return A;
    }
    
    YHNote *BHead = B;
    while (B->next) {
        B = B->next;
    }
    
    B->next = A;
    A = BHead;
    return A;
}

/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 
 你可以假设数组中不存在重复的元素。
 
 你的算法时间复杂度必须是 O(log n) 级别
 
 1 2 3 4 5 6 7 8
 2 3 4 5 6 7 8 1
 3 4 5 6 7 8 1 2
 4 5 6 7 8 1 2 3
 5 6 7 8 1 2 3 4
 6 7 8 1 2 3 4 5
 7 8 1 2 3 4 5 6
 8 1 2 3 4 5 6 7
 
 */

+ (NSInteger)search:(NSArray *)nums
             target:(NSInteger)target {
    
    NSInteger left = 0;
    NSInteger right = nums.count -1;
    
    while (left <= right) {
        NSInteger midle = (left + right) / 2;
        NSInteger value = [nums[midle] integerValue];
        if (value == target) {
            return midle;
        } else if (value < [nums[right] integerValue]) {
            if (target > [nums[midle] integerValue] && target <= [nums[right] integerValue]) {
                left = midle + 1;
            } else {
                right = midle -1;
            }
        } else {
            if (target < [nums[midle] integerValue] && target >= [nums[left] integerValue]) {
                right = midle -1;
            } else {
                left = midle + 1;
            }
        }
    }
    return -1;
}

/*
 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
 注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 */

- (NSInteger)maxProfit:(NSArray *)arr {
    //最小股票价格
    NSInteger minPrice = NSIntegerMax;
    // 最大差值
    NSInteger maxOff = 0;
    
    for (NSNumber *m in arr) {
        minPrice = MIN([m integerValue], minPrice);
        maxOff = MAX(maxOff, [m integerValue] - minPrice);
    }
    // 一层循环得到最大值
    return maxOff;
}


@end

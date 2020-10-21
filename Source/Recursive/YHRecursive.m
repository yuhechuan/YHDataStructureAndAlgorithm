//
//  YHRecursive.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/10/16.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHRecursive.h"
/*
 递归的思想
 1.拆解
 把规模大的问题转化成规模小的同类问题
 规模较小的问题又能继续变成规模更小的问题
 规模小到一定程度可以直接得到他的解
 2.求解
 由最小规模问题的解得出较大规模问题的解
 由较大规模问题的解得出更大规模问题的解
 最后得出原来问题的解
 
 递归调用的空间复杂度 = 递归深度 * 每次调用开辟的辅助空间
 */

// 当把 递归转化成 非递归 可能会优化
@implementation YHRecursive
/**
 * 时间复杂度O(n)  空间复杂度O(n)
 */
- (int)sum:(int)n {
    return  n + [self sum:n - 1];
}

// 非递归 时间复杂度O(n)  空间复杂度O(1)
- (int)sum1:(int)n {
    int t = 0;
    for (int i = 1; i <= n; i ++) {
        t += i;
    }
    return t;
}

// 非递归 时间复杂度O(1)  空间复杂度O(1)
- (int)sum2:(int)n {
    return ((n + 1) * n) >> 1;
}

// 斐波那契数列 时间复杂度 O(2的 n次方)  空间复杂度O(n)  n-1
//
- (int)fib0:(int)n {
    if (n <= 2) {
        return 1;
    }
    return [self fib0:n-1] + [self fib0:n-2];
}

// 斐波那契数列 时间复杂度 O(n)  空间复杂度O(n)
- (int)fib1:(int)n {
    if (n <= 2) {
        return 1;
    }
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < n + 1; i ++) {
        if (i <= 2) {
            [arr addObject:@(1)];
        } else {
            [arr addObject:@(0)];
        }
    }
    return [self fib11:n arr:arr];
}
// 斐波那契数列 时间复杂度 O(n)  空间复杂度O(n)
- (int)fib11:(int)n arr:(NSMutableArray *)arr {
    if ([arr[n] intValue] == 0) {
        arr[n] = @([self fib11:n-1 arr:arr] + [self fib11:n-2 arr:arr]) ;
    }
    return [arr[n] intValue];
}

// 斐波那契数列 时间复杂度 O(n)  空间复杂度O(n)
- (int)fib2:(int)n {
    if (n <= 2) {
        return 1;
    }
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < n + 1; i ++) {
       if (i <= 2) {
           [arr addObject:@(1)];
       } else {
           [arr addObject:@(0)];
       }
    }
    
    for (int i = 3; i < n + 1; i ++) {
        arr[i] = @([arr[i -1] intValue] + [arr[i -2] intValue]);
    }
    return [arr[n] intValue];
}

// 斐波那契数列 时间复杂度 O(n)  空间复杂度O(1)
- (int)fib3:(int)n {
    if (n <= 2) {
        return 1;
    }
    NSMutableArray *arr = [NSMutableArray array];
    arr[0] = @(1);
    arr[1] = @(1);
    for (int i = 3; i < n + 1; i ++) {
        arr[i & 1] = @([arr[(i -1) & 1] intValue] + [arr[(i -2) & 1] intValue]);
    }
    return [arr[n % 2] intValue];
}
// 斐波那契数列 时间复杂度 O(n)  空间复杂度O(1)
- (int)fib4:(int)n {
    if (n <= 2) {
        return 1;
    }
    int a= 1;
    int b = 1;
    for (int i = 3; i < n + 1; i ++) {
        b = a + b;
        a = b - a;
    }
    return b;
}

//斐波那契数列 时间复杂度 O(logn)  空间复杂度O(1)
- (int)fib5:(int)n {
    double c = sqrt(5);
    return (pow((1+c)/2, n) - pow((1 - c)/2, n)) / c;
}

// 上台阶 递归
- (int)climbStairs:(int)n {
    if (n <= 2) {
        return n;
    }
    return [self climbStairs:n -1] + [self climbStairs:n -1];
}
// 非递归
- (int)climbStair1:(int)n {
    if (n <= 2) {
        return n;
    }
    int a= 1;
    int b = 2;
    for (int i = 3; i < n + 1; i ++) {
        b = a + b;
        a = b - a;
    }
    return b;
}

/**
 * 汉诺塔
 * 将n 个盘子从p1 到 p3  一次只移动一个
 * 时间复杂度T(n) = 2 *T(n-1) + O(1)  = O(2的n次方)
 */
- (void)hanoi:(int)n p1:(NSString *)p1 p2:(NSString *)p2 p3:(NSString *)p3 {
    if (n == 1) {
        [self move:n from:p1 to:p3];
        return;
    }
    // 先把 n - 1 从p1 到 p2
    [self hanoi:n - 1 p1:p1 p2:p3 p3:p2];
    [self move:n from:p1 to:p3];
    [self hanoi:n - 1 p1:p2 p2:p1 p3:p3];
}

- (void)move:(int)number from:(NSString *)from to:(NSString *)to {
    NSLog(@"将%d号盘子,从%@挪动到%@",number,from,to);
}

#pragma mark --1
/**
 * 递归 一定可以转成非递归
 */
// 1.自己维护一个栈
// 2 重复利用一个栈空间

#pragma mark --2
/**
 * 尾调用
 */
// 尾调用: 最后一个动作是调用函数
// 尾递归(特殊的尾调用) 最后一个动作是调用自己
// 很多编译器 会进行尾调用优化重复利用一段占空间  涉及到栈空间拉大 -- java不支持

// ASLR 头部偏移地址

@end

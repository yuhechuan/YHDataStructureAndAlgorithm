//
//  YHHighFrequency.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/12/21.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHHighFrequency.h"
#import "YHBinaryHeap.h"

@implementation YHHighFrequency
/**
 * 283 移动 0
 */
+ (void)moveZeroes:(NSMutableArray *)nums {
    int count = (int)nums.count;
    if (!nums || count == 0) {
        return;
    }
    int cur = 0;
    for (int i = 1; i < count; i ++) {
        if ([nums[i] intValue] == 0 || cur == i) {
            continue;
        }
        nums[cur] = nums[i];
        nums[i] = @(0);
        cur ++;
    }
}

/**
 * 1. 两数之和
 *  假设只有一种答案 不能重复利用数组中 同一元素
 */
+ (NSArray *)twoSum:(NSArray *)nums
             target:(int)target {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < nums.count; i ++) {
        NSNumber *key = @(target - [nums[i] intValue]);
        if (!dict[key]) {
            dict[key] = @(i);
        } else {
            return @[key,dict[key]];
        }
    }
    return nil;
}

/**
 * 15. 三数之和
 * 不能重复利用数组中 同一元素是否是 0
 */
+ (NSArray *)threeSum:(NSArray *)nums {
    if (!nums || nums.count < 3) {
        return @[];
    }
    
    // 排序
    nums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    NSMutableArray *list = [NSMutableArray array];
    
    int length = (int)nums.count;
    for (int i = 0; i < length -2; i ++) {
        // 去重
        if (i > 0 && [nums[i] intValue] == [nums[i - 1] intValue]) {
            continue;
        }
        
        int l = i + 1;
        int r = length -1;
        int remain = - [nums[i] intValue];
        while (l < r) {
            int sum = [nums[l] intValue] + [nums[r] intValue];
            if (sum == remain) {
                // 找到了
                [list addObject:@[nums[i],nums[l],nums[r]]];
                // 去重
                while (l < r && [nums[l] intValue] == [nums[l + 1] intValue]) l++;
                while (l < r && [nums[r] intValue] == [nums[r - 1] intValue]) l--;
                
                l++;
                r--;
            } else if (sum < remain) {
                l ++;
            } else {
                r --;
            }
        }
    }
    return list;
}

/**
 * 15,pow(x,n) x的n次方
 *  快速幂
 *  分治 思想
 *  -5 >> 1  == -3
 *  -1>>1 == -1
 *  时间复杂度 O(logn)
 *  空间复杂度O (logn)
 */
+ (double)myPow1:(double)x n:(int)n {
    if (n == 0) {
        return 1;
    }
    if (n == -1) {
        return 1 / x;
    }
    BOOL odd = (n & 1) == 1;
    double half = [self myPow:x n:(n >> 1)];
    half *= half;
    // x = n < 0 ? (1/ x) :x;
    return odd ? half * x : half;
}
/**
 * 快速幂
 * 时间复杂度O(logn)
 * 空间复杂度O (1)
 */
+ (double)myPow:(double)x n:(int)n {
    BOOL neg = n < 0;
    long y = neg ? -(long)n : n;
    double result = 1.0;
    while (y > 0) {
        if ((y & 1) == 1) {
            result *= x;
        }
        x *= x;
        y >>= 1;
    }
    return neg ? (1.0/result): result;
}
/**
 * 模上z
 */
+ (int)myPow:(int)x y:(int)y z:(int)z {
    if (x < 0 || y < 0 || z == 0 ) {
        return 0;
    }
    x %= z;
    int result = 1 % z;
    while (y > 0) {
        if ((y & 1) == 1) {
            result = (result * x) %z;
        }
        x = (x * x) % z;
        y >>= 1;
    }
    return result;
}

/**
 * 62. 圆圈中最后剩下的数
 *    f(10,3) = f(11, 3) - 3;
 * f(n,m) = (f(n-1,m) + m) % n;
 */
+ (int)lastRemaining1:(int)n m:(int)m {
    if (n == 1) {
        return 0;
    }
    return ([self lastRemaining1:n -1 m:m] + m ) % n;
}

+ (int)lastRemaining:(int)n m:(int)m {
    // 当一个人时 为0
    int res = 0;
    // i 表示有多少个人
    for (int i = 2; i <= n; i ++) {
        res = (res + m) % i;
    }
    return res;
}

// 要不是从 0开始 加上1,2,3..得出编号为几的  res + off

/**
 * 54. 螺旋矩阵
 @[@[@(1),@(2),@(3), @(4)],
   @[@(4),@(5),@(6), @(7)],
   @[@(8),@(9),@(10),@(11)]];
 */

+ (NSArray *)spiralOrder:(NSArray *)matrix {
    if (!matrix || matrix.count == 0) {
        return @[];
    }
    
    int top = 0;
    int bottom = (int)matrix.count -1;
    int left = 0;
    int right = (int)[matrix[0] count] -1;
    NSMutableArray *result = [NSMutableArray array];
    while (top <= bottom && left <= right) {
        // lefttop -> righttop
        for (int i = left; i <= right; i++) {
            [result addObject:matrix[top][i]];
        }
        top ++;
        
       // righttop - > rightbottom
        for (int i = top; i <= bottom; i++) {
            [result addObject:matrix[i][right]];
        }
        right --;
        
        if ( top > bottom || left > right) {
            break;
        }
        
        for (int i =right ; i >= left; i--) {
            [result addObject:matrix[bottom][i]];
        }
        
        bottom --;
        
        for (int i = bottom; i >= top; i--) {
            [result addObject:matrix[i][left]];
        }
        left ++;
    }
    
    return result.copy;
}

/**
 * 7 整数反转
 * 如果 溢出
 */
+ (int)reverse1:(int)x {
    long res = 0;
    while (x > 0) {
        int l = x % 10;
        res = res * 10 + l;
        if (res > INT_MAX) return 0;
        if (res < INT_MIN) return 0;

        x = x / 10;
    }
    return (int)res;
}

+ (int)reverse:(int)x {
    int res = 0;
    while (x > 0) {
        int pres = res;
        res = res * 10 +  x % 10;
        
        if ((res - x % 10) / 10 != pres) {
            return 0;
        }
        x = x / 10;
    }
    return res;
}

/**
 * 146 LRU 最近最少使用   参考 YHLRUCache
 */

/**
 * 252. 会议室
 *  直接对开始时间进行排序 然后拿到上一个 的结束时间和单前开始时间 进行对比 如果结束时间大于开始时间 表示 无法参加全部会议
 */
+ (BOOL)canAttendMeeting:(NSArray *)intervals {
    if (!intervals || intervals.count == 0) {
        return YES;
    }
    NSArray *sortArr = [intervals sortedArrayUsingComparator:^NSComparisonResult(NSArray *obj1, NSArray *obj2) {
        NSNumber *s1 = [obj1 firstObject];
        NSNumber *s2 = [obj2 firstObject];
        return [s1 compare:s2];
    }];
    for (int i = 1; i < sortArr.count; i ++) {
        NSNumber *bp = [sortArr[i -1] lastObject];
        NSNumber *b = [sortArr[i] firstObject];
        if ([b compare:bp] == NSOrderedAscending) {
            return NO;
        }
    }
    return YES;
}

/**
 * 252. 会议室2
 * 时间复杂度 O(nlog(n))
 * 空间复杂度 O(n)
 */
+ (int)canAttendMeeting2:(NSArray *)intervals {
    if (!intervals || intervals.count == 0) {
        return 0;
    }
    NSArray *sortArr = [intervals sortedArrayUsingComparator:^NSComparisonResult(NSArray *obj1, NSArray *obj2) {
        NSNumber *s1 = [obj1 firstObject];
        NSNumber *s2 = [obj2 firstObject];
        return [s1 compare:s2];
    }];
    
    YHComparator *c = [[YHComparator alloc]init];
    c.compare = ^BOOL(NSNumber *a, NSNumber *b) {
        return [a intValue] < [b intValue];
    };
    // 创建一个小顶堆
    YHBinaryHeap *heap = [[YHBinaryHeap alloc]initWithComparator:c];
    [heap add:[sortArr[0] lastObject]];
    
    for (int i = 1; i < sortArr.count; i ++) {
        int headTop = [[heap get] intValue];
        int start = [[sortArr[i] firstObject] intValue];
        if (start >= headTop) {
            [heap remove];
        }
        [heap add:[sortArr[i] lastObject]];
    }
    return (int)[heap size];
}
// 用两个数据 分别对 开始时间和结束时间进行排序
+ (int)canAttendMeeting1:(NSArray *)intervals {
    if (!intervals || intervals.count == 0) {
        return 0;
    }
    NSMutableArray *start = [NSMutableArray array];
    NSMutableArray *end = [NSMutableArray array];
    
    int count = (int)intervals.count;
    
    for (int i = 0; i < count; i ++) {
        [start addObject:intervals[i][0]];
        [end addObject:intervals[i][1]];
    }
    [start sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    [end sortUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    int room = 0;
    int endIdx = 0;
    
    for (int i = 0; i < count; i ++) {
        int st = [start[i] intValue];
        int et = [end[endIdx] intValue];
        if (st >= et) {
            endIdx ++;
        } else {
            room ++;
        }
    }
    return room;
}
/**
 * 11 盛最多水的容器
 */
+ (int)maxArea:(NSArray *)heights {
    if (!heights || heights.count == 0) {
        return 0;
    }
    int l = 0;
    int r = (int)heights.count -1;
    int max = 0;
    while (l < r) {

        int minv = [heights[l] intValue] <=  [heights[r] intValue] ? [heights[l++] intValue] :[heights[r--] intValue];
        max = MAX(max, (r - l + 1) * minv);
    }
    return max;
}

/**
 * 42. 接雨水
 *  左边所有柱子最大的  和 右边最大柱子的值 其中的最大值
 *  左边和右边都有比他大的柱子
 */

+ (int)trap1:(NSArray *)heights {
    if (!heights || heights.count == 0) {
        return 0;
    }
    
    int lastIdx = (int)heights.count -2;
    
    NSMutableArray *rightMaxs = [NSMutableArray array];
    for (int i = 0; i < lastIdx + 2; i ++) {
        rightMaxs[0] = @(0);
    }

    for (int i = lastIdx; i >=1; i --) {
        rightMaxs[i] = @(MAX([rightMaxs[i +1] intValue], [heights[i + 1] intValue]));
    }
    
    int water = 0;
    int leftMax = 0;
    for (int i = 1; i <= lastIdx; i ++) {
        leftMax = MAX(leftMax, [heights[i - 1] intValue]);
        int min = MIN(leftMax,[rightMaxs[i] intValue]);
        int off = min - [heights[i] intValue];
        if (off <= 0) {
            continue;
        }
        water += off;
    }
    return water;
}

+ (int)trap:(NSArray *)heights {
    if (!heights || heights.count == 0) {
        return 0;
    }
    int water = 0;
    int lowMax = 0;
    int l = 0;
    int r = (int)heights.count - 1;
    while (l < r) {
        int lower = [heights[l] intValue] <  [heights[r] intValue] ? [heights[l++] intValue] : [heights[r--] intValue];
        lowMax = MAX(lower, lowMax);
        water += (lowMax - lower);
    }
    return water;
}
/**
 * 寻找第一个公共父视图
 */
+ (UIView *)findCommonParentView:(UIView *)A  B:(UIView *)B {
    UIView *curA = A;
    UIView *curB = B;
    while (curA != curB) {
        curA = curA.nextResponder ? (UIView *)curA.nextResponder : B;
        curB = curB.nextResponder ? (UIView *)curB.nextResponder : A;
    }
    return curA;
}
/**
 * 寻找第一个公共父视图
 */
- (NSArray *)findCommonAllParentView:(UIView *)A  B:(UIView *)B {
    UIView *curA = A;
    UIView *curB = B;
    NSMutableArray *arr = [NSMutableArray array];
    while (curA.nextResponder || curB.nextResponder) {
        curA = curA.nextResponder ? (UIView *)curA.nextResponder : B;
        curB = curB.nextResponder ? (UIView *)curB.nextResponder : A;
        if (curA == curB && curA && [curA isKindOfClass:[UIView class]]) {
            [arr addObject:curA];
        }
    }
    return arr.copy;
}

@end

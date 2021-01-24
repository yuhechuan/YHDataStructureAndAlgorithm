//
//  YHHighFrequency.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/12/21.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 高频
 */
@interface YHHighFrequency : NSObject
/**
 * 283 移动 0
 */
+ (void)moveZeroes:(NSMutableArray *)nums;

/**
 * 1. 两数之和
 */
+ (NSArray *)twoSum:(NSArray *)nums
             target:(int)target;
/**
 * 15. 三数之和
 * 不能重复利用数组中 同一元素是否是 0
 */
+ (NSArray *)threeSum:(NSArray *)nums;

/**
 * 15,pow(x,n) x的n次方
 */
+ (double)myPow:(double)x n:(int)n;
/**
 * 62 圆圈中最后剩下的数
 */
+ (int)lastRemaining:(int)n m:(int)m;
/**
 * 54. 螺旋矩阵
 *  1 2 3
 *  4 5 6
 *  7 8 9
 */
+ (NSArray *)spiralOrder:(NSArray *)matrix;
/**
 * 7 整数反转
 * 如果 溢出
 */
+ (int)reverse:(int)x;
/**
 * 252. 会议室
 */
+ (BOOL)canAttendMeeting:(NSArray *)intervals;
/**
 * 11 盛最多水的容器
 * 给定 n 个非负整数 a1，a2，…，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 */
+ (int)maxArea:(NSArray *)height;
/**
 * 42. 接雨水
 */
+ (int)trap:(NSArray *)heights;

@end

NS_ASSUME_NONNULL_END

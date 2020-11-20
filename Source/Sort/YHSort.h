//
//  YHSort.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/13.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHComparator.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 休眠排序  史上最强排序  一种思路 休眠 value时间
 */

@interface YHSort : NSObject

- (instancetype)initWithComparator:(YHComparator *)comparator;
/**
 * 待比较数组
 */
@property (nonatomic, strong) NSMutableArray *sortArray;
/**
 * 交换次数
 */
@property (nonatomic, assign) int swapCount;
/**
 * 比较次数
 */
@property (nonatomic, assign) int cmpCount;
/**
 * 耗时
 */
@property (nonatomic, assign) float time;

- (void)sort:(NSMutableArray *)sortArray;
- (void)realizeSort;
- (int)cmp:(int)p1 p2:(int)p2;
- (int)cmpv:(NSObject *)v1 v2:(NSObject *)v2;
- (void)swap:(int)p1 p2:(int)p2;

@end

NS_ASSUME_NONNULL_END

//
//  YHSort.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/13.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHSort : NSObject

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
- (int)cmpv:(int)v1 v2:(int)v2;
- (void)swap:(int)p1 p2:(int)p2;

@end

NS_ASSUME_NONNULL_END

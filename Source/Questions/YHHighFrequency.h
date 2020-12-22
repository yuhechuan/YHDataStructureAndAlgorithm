//
//  YHHighFrequency.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/12/21.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@end

NS_ASSUME_NONNULL_END

//
//  YHDynamicProgramming.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/10/28.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 动态规划
 */
@interface YHDynamicProgramming : NSObject

/**
 * 找零钱
 */
- (int)coinChange:(int)n
             faces:(NSArray *)faces;

@end

NS_ASSUME_NONNULL_END

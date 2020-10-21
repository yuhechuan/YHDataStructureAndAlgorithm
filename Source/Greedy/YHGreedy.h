//
//  YHGreedy.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/10/21.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 * 贪心策略 简单高效  未必是最优解 一般作为辅助算法
 */
@interface YHGreedy : NSObject

- (void)pirate:(int)capacity;
- (void)coinChnage;
- (void)coinChnage1;

@end

NS_ASSUME_NONNULL_END

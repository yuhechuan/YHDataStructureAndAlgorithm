//
//  YHDynamicProgramming.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/10/28.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHDynamicProgramming.h"

@implementation YHDynamicProgramming

/**
 * 找零钱 n 钱总数  faces 可使用的币种
 *
 */
- (int)coinChange:(int)n
             faces:(NSArray *)faces {
    if (n < 1 || !faces || faces.count == 0) {
        return -1;
    }
    NSMutableArray *dp = [NSMutableArray array];
    
    for (int i = 0; i < n + 1; i ++) {
        dp[i] = @(0);
    }
    
    for (int i = 1; i < n + 1; i ++) {
        int min = INT_MAX;
        for (NSNumber *f in faces) {
            int fv = [f intValue];
            if (i < fv || [dp[i] intValue] < 0) {
                continue;
            }
            min = MIN(min, [dp[i - fv] intValue]);
        }
        if (min == INT_MAX) {
            dp[i] = @(-1);
        } else {
            dp[i] = @(min +1);
        }
    }
    return [dp[n] intValue];
}

@end

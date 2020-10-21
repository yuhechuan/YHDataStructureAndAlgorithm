//
//  YHGreedy.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/10/21.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHGreedy.h"

@implementation YHGreedy
/**
 * 海盗
 */
- (void)pirate:(int)capacity {
    NSArray *weights = @[@(3),@(5),@(4),@(10),@(7),@(14),@(2),@(11)];
    
    NSArray *sortWeights = [weights sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull obj1, NSNumber * _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    int weight = 0;
    int count = 0;
    for (int i = 0; i < sortWeights.count && weight < capacity; i ++) {
        int w = [sortWeights[i] intValue];
        if (w + weight <= capacity) {
            weight += w;
            count ++;
            NSLog(@"%d",w);
        }
    }
    NSLog(@"一共装了%d件古董",count);
}
/**
 * 找零钱
 */
- (void)coinChnage {
    NSArray *faces = @[@(25),@(10),@(5),@(1)];
    int money = 41;
    int count = 0;
    
    for (int i = 0; i < faces.count; i ++) {
        int w = [faces[i] intValue];
        if (money < w ) {
            continue;
        }
        NSLog(@"%d",w);
        money -= w;
        count ++;
        i = -1;
    }
    NSLog(@"%d",count);
}

- (void)coinChnage1 {
    NSArray *faces = @[@(25),@(10),@(5),@(1)];
    int money = 41;
    int count = 0;
    int i = 0;
    while (i < faces.count) {
        int w = [faces[i] intValue];
        if (money < w ) {
            i ++;
            continue;
        }
        NSLog(@"%d",w);
        money -= w;
        count ++;
    }
    NSLog(@"%d",count);
}
@end

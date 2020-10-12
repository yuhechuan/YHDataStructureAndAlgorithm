//
//  YHQuickUnionSize.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHQuickUnionSize.h"

@implementation YHQuickUnionSize

/**
 * 将v1的根节点 嫁接到v2的根节点上
 */
- (void)union_:(id<NSCopying>)v1 b:(id<NSCopying>)v2 {
    YHUFNode *p1 = [self findNode:v1];
    YHUFNode *p2 = [self findNode:v2];
    if ([self objectIsEqual:p1 v2:p2]) {
        return;
    }
    if (p1.size < p2.size) {
        p1.parent = p2;
        p2.size += p1.size;
    } else {
        p2.parent = p1;
        p1.size += p2.size;
    }
}

@end

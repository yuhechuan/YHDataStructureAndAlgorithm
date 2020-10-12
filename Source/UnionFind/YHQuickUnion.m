//
//  YHQuickUnion.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHQuickUnion.h"

@implementation YHQuickUnion
/**
 * 找到根部元素
 */
- (YHUFNode *)findNode:(id<NSCopying>)v {
    YHUFNode *node = _nodes[v];
    if (!node) {
        return nil;
    }
    
    while (![self objectIsEqual:node v2:node.parent]) {
        node = node.parent;
    }
    return node;
}

/**
 * 将v1的根节点 嫁接到v2的根节点上
 */
- (void)union_:(id<NSCopying>)v1 b:(id<NSCopying>)v2 {
    YHUFNode *p1 = [self findNode:v1];
    YHUFNode *p2 = [self findNode:v2];
    if ([self objectIsEqual:p1 v2:p2]) {
        return;
    }
    p1.parent = p2;
}

@end

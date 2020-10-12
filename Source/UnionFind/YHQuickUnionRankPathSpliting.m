//
//  YHQuickUnionRankPathSpliting.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHQuickUnionRankPathSpliting.h"

@implementation YHQuickUnionRankPathSpliting

- (YHUFNode *)findNode:(id<NSCopying>)v {
    YHUFNode *node = _nodes[v];
    if (!node) {
        return nil;
    }
    while (![self objectIsEqual:node v2:node.parent]) {
        YHUFNode *p = node.parent;
        node.parent = p.parent;
        node = p;
    }
    return node;
}

@end

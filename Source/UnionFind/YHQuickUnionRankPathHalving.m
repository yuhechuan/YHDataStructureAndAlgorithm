//
//  YHQuickUnionRankPathHalving.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHQuickUnionRankPathHalving.h"

@implementation YHQuickUnionRankPathHalving

- (YHUFNode *)findNode:(id<NSCopying>)v {
    YHUFNode *node = _nodes[v];
    if (!node) {
        return nil;
    }
    while (![self objectIsEqual:node v2:node.parent]) {
        node.parent = node.parent.parent;
        node = node.parent;
    }
    return node;
}

@end

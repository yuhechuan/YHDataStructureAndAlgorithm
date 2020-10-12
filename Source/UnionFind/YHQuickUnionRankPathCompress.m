//
//  YHQuickUnionRankPathCompress.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHQuickUnionRankPathCompress.h"

@implementation YHQuickUnionRankPathCompress

- (YHUFNode *)findNode:(id<NSCopying>)v {
    YHUFNode *node = _nodes[v];
    if (!node) {
        return nil;
    }
    if (![self objectIsEqual:node v2:node.parent]) {
        node.parent = [self findNode:node.parent.value];
    }
    return node.parent;
}

@end

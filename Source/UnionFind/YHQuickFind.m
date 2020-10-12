//
//  YHQuickFind.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/7/23.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHQuickFind.h"


@implementation YHQuickFind 

/**
 * 查找一个 元素的父节点
 */

- (YHUFNode *)findNode:(id<NSCopying>)v {
    YHUFNode *node = _nodes[v];
    if (!node) {
        return nil;
    }
    return node.parent;
}

- (void)union_:(id<NSCopying>)v1 b:(id<NSCopying>)v2 {
    YHUFNode *p1 = [self findNode:v1];
    YHUFNode *p2 = [self findNode:v2];
    if ([self objectIsEqual:p1 v2:p2]) {
        return;
    }
    
    [_nodes enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, YHUFNode *obj, BOOL * _Nonnull stop) {
        if ([self objectIsEqual:p1 v2:obj.parent]) {
            obj.parent = p2;
        }
    }];
}


@end

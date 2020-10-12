//
//  YHUnionFind.m
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHUnionFind.h"

@implementation YHUnionFind

- (instancetype)init {
    if (self = [super init]) {
        _nodes = [NSMutableDictionary dictionary];
    }
    return self;
}

/**
 * 查找一个 元素的父节点
 */
- (id<NSCopying>)find:(id<NSCopying>)v {
    if (!v) {
        return nil;
    }
    YHUFNode *node = [self findNode:v];
    return node ? node.value : nil;
}
/**
 * 查找根节点
 */
- (YHUFNode *)findNode:(id<NSCopying>)v  {
    YHUFNode *node = _nodes[v];
    if (!node) {
        return nil;
    }
    return nil;
}

/**
 * 链接两个元素
 */
- (void)union_:(id<NSCopying>)v1 b:(id<NSCopying>)v2 {}

/**
 * 查看两个是否是有链接的
 */
- (BOOL)isConnected:(id<NSCopying>)v1 v2:(id<NSCopying>)v2 {
    YHUFNode *p1 = [self findNode:v1];
    YHUFNode *p2 = [self findNode:v2];
    return [p1 isEqual:p2];
}

- (void)makeSet:(id<NSCopying>)v {
    if (!v || _nodes[v]) {
        return;
    }
    YHUFNode *node = [[YHUFNode alloc]initWithValue:v];
    _nodes[v] = node;
}

/**
 * 判断是否相等
 */
- (BOOL)objectIsEqual:(YHUFNode *)p1 v2:(YHUFNode *)p2 {
    NSObject *value1 = (NSObject *)p1.value;
    NSObject *value2 = (NSObject *)p2.value;
    return [value1 isEqual:value2];
}

@end

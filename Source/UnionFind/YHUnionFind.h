//
//  YHUnionFind.h
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/10.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHUFNode.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 并查集
 */
@interface YHUnionFind : NSObject {
    NSMutableDictionary *_nodes;
}

/**
 * 查找一个 元素的父节点
 */
- (id<NSCopying>)find:(id<NSCopying>)v;
/**
 * 查找根节点
 */
- (YHUFNode *)findNode:(id<NSCopying>)v;
/**
 * 链接两个元素
 */
- (void)union_:(id<NSCopying>)v1
            b:(id<NSCopying>)v2;
/**
 * 查看两个是否是有链接的
 */
- (BOOL)isConnected:(id<NSCopying>)v1
                v2:(id<NSCopying>)v2;
/**
 * 初始化
 */
- (void)makeSet:(id<NSCopying>)v;
/**
 * 判断是否相等
 */
- (BOOL)objectIsEqual:(YHUFNode *)p1 v2:(YHUFNode *)p2;

@end

NS_ASSUME_NONNULL_END

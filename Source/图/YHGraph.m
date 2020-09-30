//
//  YHGraph.m
//  YHGraph
//
//  Created by yuhechuan on 2020/9/24.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHGraph.h"

@implementation YHEdgeInfo

- (instancetype)initWithFrom:(id<NSCopying>)from to:(id<NSCopying>)to weight:(NSObject *)weight {
    if (self = [super init]) {
        _from = from;
        _to = to;
        _weight = weight;
    }
    return self;
}

@end

@implementation YHGraph
/**
 * 添加一个顶点 子类实现
 */
- (void)addVertex:(id<NSCopying>)v{}
/**
 * 添加一条不带权重的边  子类实现
 */
- (void)addEdge:(id<NSCopying>)from to:(id<NSCopying>)to{}
/**
 * 添加一条带权重的边  子类实现
 */
- (void)addEdge:(id<NSCopying>)from to:(id<NSCopying>)to weight:(NSObject *)weight{}
/**
 * 删除一个顶点  子类实现
 */
- (void)removeVertex:(id<NSCopying>)v{}
/**
 * 删除一条边  子类实现
 */
- (void)removeEdge:(id<NSCopying>)from to:(id<NSCopying>)to{}
/**
 * 边的个数  子类实现
 */
- (NSUInteger)edgesCount{return 0;}
/**
 * 顶点的个数  子类实现
 */
- (NSUInteger)vertexCount{return 0;}
/**
 * 广度优先搜索  子类实现
 */
- (void)bsf:(id<NSCopying>)v visitor:(YHVisitor *)visitor{}
/**
 * 深度优先搜索  子类实现
 */
- (void)dsf:(id<NSCopying>)v visitor:(YHVisitor *)visitor{}
/**
 * 拓扑排序
 */
- (NSArray *)topologicSort{return nil;}

@end

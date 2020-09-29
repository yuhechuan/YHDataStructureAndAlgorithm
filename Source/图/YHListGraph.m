//
//  YHListGraph.m
//  YHGraph
//
//  Created by yuhechuan on 2020/9/25.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHListGraph.h"
#import "YHQueue.h"
#import "YHStack.h"

@class YHVertex;
@class YHEdge;

@interface YHVertex : NSObject<NSCopying>

@property (nonatomic, strong) id<NSCopying> value;
@property (nonatomic, strong) NSMutableSet <YHEdge *>*inEdges;
@property (nonatomic, strong) NSMutableSet <YHEdge *>*outEdges;

@end

@implementation YHVertex

- (id)copyWithZone:(NSZone *)zone {
    YHVertex *v = [[[self class] alloc] init]; // <== 注意这里
    v.value = self.value;
    v.inEdges = self.inEdges;
    v.outEdges = self.outEdges;
    return v;
}

+ (instancetype)vertexWithValue:(id<NSCopying>)value {
    YHVertex *v = [[YHVertex alloc]init];
    v.value = value;
    return v;
}

- (NSMutableSet<YHEdge *> *)inEdges {
    if (!_inEdges) {
        _inEdges = [NSMutableSet set];
    }
    return _inEdges;
}

- (NSMutableSet<YHEdge *> *)outEdges {
    if (!_outEdges) {
        _outEdges = [NSMutableSet set];
    }
    return _outEdges;
}

- (BOOL)isEqual:(id)object {
    YHVertex *v = (YHVertex *)object;
    return [(NSObject *)v.value isEqual:(NSObject *)_value];
}

- (NSUInteger)hash {
    return _value == nil ? 0 : ((NSObject *)_value).hash;
}

- (NSString *)description {
    return _value == nil ? @"nil": ((NSObject *)_value).description;
}

@end

@interface YHEdge : NSObject

@property (nonatomic, strong) YHVertex *to;
@property (nonatomic, strong) YHVertex *from;
@property (nonatomic, strong) NSObject *weight;

@end

@implementation YHEdge

+ (instancetype)edgeWithFrom:(YHVertex *)from
                          to:(YHVertex *)to {
    YHEdge *edge = [[YHEdge alloc]init];
    edge.from = from;
    edge.to = to;
    return edge;
}

- (BOOL)isEqual:(id)object {
    YHEdge *e = (YHEdge *)object;
    return [e.from isEqual:_from]  && [e.to isEqual:_to];
}

- (NSUInteger)hash {
    return _from.hash *31 + _to.hash;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Edge = from:%@ to:%@ weight:%@",_from,_to,_weight];
}

@end

@interface YHListGraph ()

@property (nonatomic, strong) NSMutableDictionary <id<NSCopying>,YHVertex *>*vertexs;
@property (nonatomic, strong) NSMutableSet <YHEdge *>*edges;

@property (nonatomic, strong) NSMutableSet <YHVertex *>*bfsVertexs;
@property (nonatomic, strong) NSMutableSet <YHVertex *>*dfsVertexs;


@end

@implementation YHListGraph

- (void)printGraph {
    [self.vertexs enumerateKeysAndObjectsUsingBlock:^(id<NSCopying>  _Nonnull key, YHVertex * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@===================",key);
        NSLog(@"===========out=============");
        NSLog(@"%@",obj.outEdges);
        NSLog(@"===========in=============");
        NSLog(@"%@",obj.inEdges);
    }];
    [self.edges enumerateObjectsUsingBlock:^(YHEdge * _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@",obj);
    }];
}

- (NSUInteger)vertexCount {
    return self.vertexs.count;
}

- (NSUInteger)edgesCount {
    return self.edges.count;
}

- (void)addVertex:(id<NSCopying>)v {
    if (self.vertexs[v]) return;
    self.vertexs[v] = [YHVertex vertexWithValue:v];
}

- (void)addEdge:(id<NSCopying>)from to:(id<NSCopying>)to {
    [self addEdge:from to:to weight:nil];
}

- (void)addEdge:(id<NSCopying>)from to:(id<NSCopying>)to weight:(NSObject *)weight {
    
    YHVertex *fromVertex = self.vertexs[from];
    if (!fromVertex) {
        fromVertex = [YHVertex vertexWithValue:from];
        self.vertexs[from] = fromVertex;
    }
    
    YHVertex *toVertex = self.vertexs[to];
    if (!toVertex) {
        toVertex = [YHVertex vertexWithValue:to];
        self.vertexs[to] = toVertex;
    }
    
    YHEdge *edge = [YHEdge edgeWithFrom:fromVertex to:toVertex];
    edge.weight = weight;
    if ([fromVertex.outEdges containsObject:edge]) {
        [fromVertex.outEdges removeObject:edge];
        [toVertex.inEdges removeObject:edge];
        [self.edges removeObject:edge];
    }
    
    [fromVertex.outEdges addObject:edge];
    [toVertex.inEdges addObject:edge];
    [self.edges addObject:edge];
}

- (void)removeVertex:(id<NSCopying>)v {
    YHVertex *vertex = self.vertexs[v];
    if (!vertex) return;
    
    [self.vertexs removeObjectForKey:v];
    
    // 删除进入的边 和 出来的边
    NSMutableSet *outSet = [vertex.outEdges mutableCopy];
    for (YHEdge *edge in outSet) {
        [edge.to.inEdges removeObject:edge];
        [vertex.outEdges removeObject:edge];
        [self.edges removeObject:edge];
    }
    
    NSMutableSet *inSet = [vertex.inEdges mutableCopy];
    for (YHEdge *edge in inSet) {
        [edge.from.outEdges removeObject:edge];
        [vertex.inEdges removeObject:edge];
        [self.edges removeObject:edge];
    }
}

- (void)removeEdge:(id<NSCopying>)from to:(id<NSCopying>)to {
    YHVertex *fromVertex = self.vertexs[from];
    if (!fromVertex) return;
    YHVertex *toVertex = self.vertexs[to];
    if (!toVertex) return;
    // 两个点存在
    YHEdge *edge = [YHEdge edgeWithFrom:fromVertex to:toVertex];
    if ([fromVertex.outEdges containsObject:edge]) {
       [fromVertex.outEdges removeObject:edge];
       [toVertex.inEdges removeObject:edge];
       [self.edges removeObject:edge];
    }
}

- (void)bsf:(id<NSCopying>)v visitor:(YHVisitor *)visitor {
    YHVertex *vertex = self.vertexs[v];
    if (!vertex || !visitor.visit) return;
    [self.bfsVertexs removeAllObjects];
    [self _bsf:vertex visitor:visitor];
}

- (void)_bsf:(YHVertex *)vertex visitor:(YHVisitor *)visitor {
    // 申请一个队列
    YHQueue *queue = [[YHQueue alloc]init];
    [queue enQueue:vertex];
    NSMutableSet *set = [NSMutableSet set];
    [set addObject:vertex];
    
    while (queue.size > 0) {
        YHVertex *v = [queue deQueue];
        if (visitor.visit(v.value)) {
           return;
        }
        for (YHEdge *edge in v.outEdges) {
            if ([set containsObject:edge.to]) {
                continue;
            }
            [queue enQueue:edge.to];
            [set addObject:edge.to];
        }
    }
}

- (void)dsf:(id<NSCopying>)v visitor:(YHVisitor *)visitor {
    YHVertex *vertex = self.vertexs[v];
    if (!vertex || !visitor.visit) return;
    [self.dfsVertexs removeAllObjects];
    [self _dsf:vertex visitor:visitor];
}

- (void)dsfRecursion:(id<NSCopying>)v visitor:(YHVisitor *)visitor {
    YHVertex *vertex = self.vertexs[v];
    if (!vertex || !visitor.visit) return;
    [self.dfsVertexs removeAllObjects];
    [self _dsfRecursion:vertex visitor:visitor];
}


// 递归
- (void)_dsfRecursion:(YHVertex *)vertex visitor:(YHVisitor *)visitor {
    if (visitor.visit(vertex.value)) {
        return;
    }
    [self.dfsVertexs addObject:vertex];
    
    for (YHEdge *edge in vertex.outEdges) {
        if ([self.dfsVertexs containsObject:edge.to]) {
            continue;
        }
        [self _dsfRecursion:edge.to visitor:visitor];
    }
}

// 非递归
- (void)_dsf:(YHVertex *)vertex visitor:(YHVisitor *)visitor {
    YHStack *stack = [[YHStack alloc]init];
    if (visitor.visit(vertex.value)) {
       return;
    }
    [stack push:vertex];
    [self.dfsVertexs addObject:vertex];
    
    while (stack.size > 0) {
        YHVertex *v = [stack pop];
        for (YHEdge *edge in v.outEdges) {
            if ([self.dfsVertexs containsObject:edge.to]) continue;
            
            [stack push:edge.from];
            [stack push:edge.to];
            [self.dfsVertexs addObject:edge.to];
            if (visitor.visit(edge.to.value)) {
                return;
            }
            break;
        }
    }
}

- (NSArray *)topologicSort {
    NSMutableArray *list = [NSMutableArray array];
    YHQueue *queue = [[YHQueue alloc]init];
    NSMutableDictionary *ins = [NSMutableDictionary dictionary];
    [self.vertexs enumerateKeysAndObjectsUsingBlock:^(id<NSCopying>  _Nonnull key, YHVertex * _Nonnull obj, BOOL * _Nonnull stop) {
        int inSize = (int)obj.inEdges.count;
        if (inSize == 0) {
            [queue enQueue:obj];
        } else {
            ins[obj] = @(inSize);
        }
    }];
    
    while (!queue.isEmpty) {
        YHVertex *v = [queue deQueue];
        // 结果返回结果中
        [list addObject:v.value];
        
        for (YHEdge *edge in v.outEdges) {
            int toin = [ins[edge.to] intValue] - 1;
            if (toin == 0) {
                [queue enQueue:edge.to];
            } else {
                ins[edge.to] = @(toin);
            }
        }
    }
    return list.copy;
}


- (NSMutableDictionary<id<NSCopying>,YHVertex *> *)vertexs {
    if (!_vertexs) {
        _vertexs = [NSMutableDictionary dictionary];
    }
    return _vertexs;
}

- (NSMutableSet<YHEdge *> *)edges {
    if (!_edges) {
        _edges = [NSMutableSet set];
    }
    return _edges;
}

- (NSMutableSet<YHVertex *> *)bfsVertexs {
    if (!_bfsVertexs) {
        _bfsVertexs = [NSMutableSet set];
    }
    return _bfsVertexs;
}

- (NSMutableSet<YHVertex *> *)dfsVertexs {
    if (!_dfsVertexs) {
        _dfsVertexs = [NSMutableSet set];
    }
    return _dfsVertexs;
}

@end

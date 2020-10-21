//
//  YHGraph.m
//  YHGraph
//
//  Created by yuhechuan on 2020/9/24.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHGraph.h"


@implementation YHWeightManager

@end

@implementation YHEdgeInfo

- (instancetype)initWithFrom:(id<NSCopying>)from to:(id<NSCopying>)to weight:(NSObject *)weight {
    if (self = [super init]) {
        _from = from;
        _to = to;
        _weight = weight;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"from: %@  to:%@  weight:%@",_from,_to,_weight];
}

@end

@implementation YHPathInfo

- (NSMutableArray<YHEdgeInfo *> *)edgeInfos {
    if (!_edgeInfos) {
        _edgeInfos = [NSMutableArray array];
    }
    return _edgeInfos;
}

- (NSString *)description {
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:[NSString stringWithFormat:@"total-weight: %@",_weight]];
    for (YHEdgeInfo *info in _edgeInfos) {
        [arr addObject: [NSString stringWithFormat:@"from: %@  to:%@  weight:%@",info.from,info.to,info.weight]];
    }
    return [arr componentsJoinedByString:@"=="];
}

@end

@implementation YHGraph

- (instancetype)initWeightManager:(YHWeightManager *)weightManager {
    if (self = [super init]) {
        _weightManager = weightManager;
    }
    return self;
}

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
/**
 * 最小生成树
 */
- (NSSet<YHEdgeInfo *> *)mst{return nil;}
/**
 * 最短路径
 */
- (NSDictionary <id<NSCopying>,YHPathInfo *>*)shortestPath:(id<NSCopying>)v{return nil;}

@end

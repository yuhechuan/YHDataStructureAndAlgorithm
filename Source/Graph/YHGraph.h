//
//  YHGraph.h
//  YHGraph
//
//  Created by yuhechuan on 2020/9/24.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHVisitor;
@class YHOneLinked;

@interface YHWeightManager : NSObject

@property(nonatomic, copy) BOOL (^comparator)(id a,id b);
@property(nonatomic, copy) id (^add)(id a,id b);
@property(nonatomic, copy) id (^zero)(void);

@end

@interface YHEdgeInfo : NSObject

@property (nonatomic) id<NSCopying> from;
@property (nonatomic) id<NSCopying> to;
@property (nonatomic) NSObject *weight;

- (instancetype)initWithFrom:(id<NSCopying>)from to:(id<NSCopying>)to weight:(NSObject *)weight;

@end

@interface YHPathInfo : NSObject

@property (nonatomic, strong) NSObject *weight;
@property (nonatomic, strong) NSMutableArray <YHEdgeInfo *>*edgeInfos;

@end


@interface YHGraph : NSObject

@property (nonatomic,strong) YHWeightManager *weightManager;

- (instancetype)initWeightManager:(YHWeightManager *)weightManager;

- (void)addVertex:(id<NSCopying>)v;
- (void)addEdge:(id<NSCopying>)from to:(id<NSCopying>)to;
- (void)addEdge:(id<NSCopying>)from to:(id<NSCopying>)to weight:(NSObject *)weight;

- (void)removeVertex:(id<NSCopying>)v;
- (void)removeEdge:(id<NSCopying>)from to:(id<NSCopying>)to;

- (NSUInteger)edgesCount;
- (NSUInteger)vertexCount;

- (void)bsf:(id<NSCopying>)v visitor:(YHVisitor *)visitor;
- (void)dsf:(id<NSCopying>)v visitor:(YHVisitor *)visitor;

- (NSArray *)topologicSort;
- (NSSet<YHEdgeInfo *> *)mst;
- (NSDictionary <id<NSCopying>,YHPathInfo *>*)shortestPath:(id<NSCopying>)v;
- (NSDictionary <id<NSCopying>,NSDictionary <id<NSCopying>,YHPathInfo *>*>*)allShortestPath;


@end

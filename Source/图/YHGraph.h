//
//  YHGraph.h
//  YHGraph
//
//  Created by yuhechuan on 2020/9/24.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHVisitor;

@interface YHEdgeInfo : NSObject

@property (nonatomic) id<NSCopying> from;
@property (nonatomic) id<NSCopying> to;
@property (nonatomic) NSObject *weight;

@end

@interface YHGraph : NSObject

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

@end

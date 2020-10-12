//
//  YHListGraph.h
//  YHGraph
//
//  Created by yuhechuan on 2020/9/25.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import "YHGraph.h"

/**
 * 邻接表类似实现
 */
@interface YHListGraph : YHGraph

- (void)printGraph;
- (void)dsfRecursion:(id<NSCopying>)v visitor:(YHVisitor *)visitor;

@end

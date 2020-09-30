//
//  YHBinaryHeap.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/9/29.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHHeap.h"
#import "MJBinaryTreeInfo.h"
#import "YHComparator.h"

@interface YHBinaryHeap : YHHeap<MJBinaryTreeInfo>

- (instancetype)initWithComparator:(YHComparator *)comparator;
- (instancetype)initWithComparator:(YHComparator *)comparator
                          elements:(NSArray *)elements;

- (NSArray *)heapElements;

@end


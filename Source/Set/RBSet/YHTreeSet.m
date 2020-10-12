//
//  YHTreeSet.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/7/1.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHTreeSet.h"
#import "YHRBTree.h"
#import "YHVisitor.h"

@implementation YHTreeSet {
    YHRBTree *rBTree;
}

- (instancetype)init {
    if (self = [super init]) {
        rBTree = [[YHRBTree alloc]init];
    }
    return self;
}

/**
 * 清除所有元素
 */
- (void)clear {
    [rBTree clear];
}

/**
 * 元素的数量
 */
- (NSInteger)size {
    return rBTree->size;
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
   return [rBTree isEmpty];
}

/**
 * 是否包含某个元素
 */
- (BOOL)contains:(id)element{
    return [rBTree contains:element];
}

/**
 * 添加元素到尾部
 */
- (void)add:(id)element {
    [rBTree add:element];
}

/**
 * 删除元素
 */
- (void)remove:(id)element {
    [rBTree remove:element];
}

/*
 遍历 中序遍历
 */
- (void)traversal:(Visitor)visitor {
    YHVisitor *v = [YHVisitor new];
    v.visit = ^BOOL(id  _Nonnull object) {
        return visitor(object);
    };
    [rBTree inorder:v];
}

@end

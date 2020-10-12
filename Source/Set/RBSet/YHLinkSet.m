//
//  YHLinkSet.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/7/1.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHLinkSet.h"
#import "YHDoubleLinked.h"

@implementation YHLinkSet {
    YHDoubleLinked *list;
}

- (instancetype)init {
    if (self = [super init]) {
        list = [YHDoubleLinked new];
    }
    return self;
}

/**
 * 清除所有元素
 */
- (void)clear {
    [list clear];
}

/**
 * 元素的数量
 */
- (NSInteger)size {
    return list->size;
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
    return [list isEmpty];
}

/**
 * 是否包含某个元素
 */
- (BOOL)contains:(id)element {
    return [list contains:element];
}

/**
 * 添加元素到尾部
 */
- (void)add:(id)element {
    // x先判断 还是否存在
    if ([list contains:element]) {
        NSInteger index = [list indexOf:element];
        [list setObject:element atIndex:index];
    } else {
        [list add:element];
    }
}

/**
 * 删除元素
 */
- (void)remove:(id)element {
    NSInteger index = [list indexOf:element];
    if (index > 0) {
        [list remove:index];
    }
}

/*
 遍历
 */
- (void)traversal:(Visitor)visitor {
    NSInteger count = list->size;
    for (int i = 0; i < count; i ++) {
        if (visitor([list get:i])) {
            break;
        }
    }
}

@end

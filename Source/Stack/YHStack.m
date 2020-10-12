//
//  YHStack.m
//  算法
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHStack.h"

@interface YHStack () {
    NSMutableArray *arrayList;
}


@end

@implementation YHStack

- (instancetype)init {
    if (self = [super init]) {
        arrayList = [NSMutableArray array];
    }
    return self;
}

/**
 * 元素的数量
 */
- (NSInteger)size {
    return arrayList.count;
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
    return arrayList.count == 0;
}

/**
 * 入栈
 */
- (void)push:(id)element {
    [arrayList addObject:element];
}

/**
 * 出栈
 */
- (id)pop {
    id e = [arrayList lastObject];
    [arrayList removeLastObject];
    return e;
}

/**
 * 栈顶元素
 */
- (id)peek {
    return [arrayList lastObject];
}

@end

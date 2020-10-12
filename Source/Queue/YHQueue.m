//
//  YHQueue.m
//  算法
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHQueue.h"
#import "YHDoubleLinked.h"

@interface YHQueue () {
    YHDoubleLinked *linkedList;
}

@end

@implementation YHQueue

- (instancetype)init {
    if (self = [super init]) {
        linkedList = [[YHDoubleLinked alloc]init];
    }
    return self;
}


/**
 * 元素的数量
 */
- (NSInteger)size {
    return [linkedList size];
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
    return [linkedList isEmpty];
}

/**
 * 入队
 */
- (void)enQueue:(id)element {
    [linkedList add:element];
}

/**
 * 出队
 */
- (id)deQueue {
   return [linkedList remove:0];
}

/**
 * 获取队列的头元素
 */
- (id)front {
    return linkedList->frist;
}

/**
 * 清空队列
 */
- (void)clear {
    [linkedList clear];
}



@end

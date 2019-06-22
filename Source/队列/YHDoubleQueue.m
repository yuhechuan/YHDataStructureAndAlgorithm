//
//  YHDoubleQueue.m
//  算法
//
//  Created by ruaho on 2019/5/28.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHDoubleQueue.h"
#import "YHDoubleLinked.h"

@interface YHDoubleQueue () {
    YHDoubleLinked *linkedList;
}

@end

@implementation YHDoubleQueue

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
    return linkedList.size;
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
    return linkedList.isEmpty;
}

/**
 * 队尾入队
 */
- (void)enQueueRear:(id)element {
    [linkedList add:element];
}

/**
 * 对头入队
 */
- (void)enQueueFront:(id)element {
    return [linkedList addObject:element atIndex:0];
}

/**
 * 队尾出队
 */
- (id)deQueueRear {
  return [linkedList remove:linkedList.size -1];
}

/**
 * 队头出队
 */
- (id)deQueueFront {
   return [linkedList remove:0];
}


/**
 * 获取队列的头元素
 */
- (id)front {
    return [linkedList get:0];
}

/**
 * 获取队列的尾元素
 */
- (id)rear {
    return [linkedList get:linkedList.size -1];
}

/**
 * 清空队列
 */
- (void)clear {
    [linkedList clear];
}

@end

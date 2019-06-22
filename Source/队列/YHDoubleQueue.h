//
//  YHDoubleQueue.h
//  算法
//
//  Created by ruaho on 2019/5/28.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHDoubleQueue : NSObject

/**
 * 元素的数量
 */
- (NSInteger)size;

/**
 * 是否为空
 */
- (BOOL)isEmpty;

/**
 * 队尾入队
 */
- (void)enQueueRear:(id)element;

/**
 * 对头入队
 */
- (void)enQueueFront:(id)element;

/**
 * 队尾出队
 */
- (id)deQueueRear;

/**
 * 队头出队
 */
- (id)deQueueFront;


/**
 * 获取队列的头元素
 */
- (id)front;

/**
 * 获取队列的尾元素
 */
- (id)rear;

/**
 * 清空队列
 */
- (void)clear;

@end

NS_ASSUME_NONNULL_END

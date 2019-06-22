//
//  YHQueue.h
//  算法
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHQueue : NSObject


/**
 * 元素的数量
 */
- (NSInteger)size;

/**
 * 是否为空
 */
- (BOOL)isEmpty;

/**
 * 入队
 */
- (void)enQueue:(id)element;

/**
 * 出队
 */
- (id)deQueue;

/**
 * 获取队列的头元素
 */
- (id)front;

/**
 * 清空队列
 */
- (void)clear;


@end

NS_ASSUME_NONNULL_END

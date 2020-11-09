//
//  YHSkipList.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/7.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHSkipComparator.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 跳表
 */
@interface YHSkipList : NSObject

- (instancetype)initWithComparator:(YHSkipComparator *)comparator;

/**
 * 元素的数量
 */
- (NSInteger)size;

/**
 * 是否为空
 */
- (BOOL)isEmpty;
/**
 * 添加元素
 */
- (NSObject *)put:(id<NSCopying>)key value:(NSObject *)value;
/**
 * 获取元素
 */
- (NSObject *)get:(id<NSCopying>)key;
/**
 * 删除元素
 */
- (NSObject *)remove:(id<NSCopying>)key;

@end

NS_ASSUME_NONNULL_END

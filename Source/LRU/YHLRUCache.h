//
//  YHLRUCache.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/12/24.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHLRUCache : NSObject

- (instancetype)initWithCapacity:(int)capacity;
/**
 * 向缓存中加入缓存一个元素
 */
- (void)put:(id<NSCopying>)key value:(id)value;
/**
 * 获取缓存一个元素
 */
- (id)get:(id<NSCopying>)key;
/**
 * 清空缓存
 */
- (void)clearAllCache;

@end

NS_ASSUME_NONNULL_END

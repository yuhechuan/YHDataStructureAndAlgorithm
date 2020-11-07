//
//  YHBloomFilter.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/4.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 布隆过滤器
 * 返回false 一定不存在
 * 返回true  可能存在
 * 优点: 空间效率和查询时间 远远超过一般算法
 * 缺点: 有一定的误判率
 */
@interface YHBloomFilter : NSObject

/**
 * sacle数据规模
 * rate 误判率
 */
- (instancetype)initScale:(int)sacle
                     rate:(double)rate;
/**
 * 添加元素
 */
- (void)put:(NSObject *)value;
/**
 * 是否包含
 */
- (BOOL)contains:(NSObject *)value;

@end

NS_ASSUME_NONNULL_END

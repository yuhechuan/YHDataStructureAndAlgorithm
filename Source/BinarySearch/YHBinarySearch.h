//
//  YHBinarySearch.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/18.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHComparator.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * 二分搜索
 */
@interface YHBinarySearch : NSObject

- (instancetype)initWithComparator:(YHComparator *)comparator;
/**
 * 如果存在多个 重复的值 返回值不确定位置
 */
- (int)indexOf:(NSArray *)array
             v:(NSObject *)v;
- (int)search:(NSArray *)array
            v:(NSObject *)v;
            

@end

NS_ASSUME_NONNULL_END

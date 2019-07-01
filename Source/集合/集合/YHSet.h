//
//  YHSet.h
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/7/1.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^Visitor)(id element);

NS_ASSUME_NONNULL_BEGIN

@protocol YHSet <NSObject>

/**
 * 清除所有元素
 */
- (void)clear;

/**
 * 元素的数量
 */
- (NSInteger)size;

/**
 * 是否为空
 */
- (BOOL)isEmpty;

/**
 * 是否包含某个元素
 */
- (BOOL)contains:(id)element;

/**
 * 添加元素到尾部
 */
- (void)add:(id)element;

/**
 * 删除元素
 */
- (void)remove:(id)element;

/*
 遍历
 */
- (void)traversal:(Visitor)visitor;


@end

NS_ASSUME_NONNULL_END

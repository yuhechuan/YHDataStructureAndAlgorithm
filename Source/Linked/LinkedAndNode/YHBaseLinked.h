//
//  YHBaseLinked.h
//  算法
//
//  Created by ruaho on 2019/5/22.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHNote.h"

#define ELEMENT_NOT_FOUND -1

NS_ASSUME_NONNULL_BEGIN

@interface YHBaseLinked : NSObject {
    @public
    NSInteger size;
    YHNote *frist;
    YHNote *last;
}

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
 * 获取index位置的元素
 */
- (id)get:(NSInteger)index;

/**
 * 设置index位置的元素
 * @return 原来的元素ֵ
 */
- (id)setObject:(id)obj atIndex:(NSInteger)index;

/**
 * 在index位置插入一个元素
 */
- (void)addObject:(id)object atIndex:(NSInteger)index;

/**
 * 删除index位置的元素
 */
- (id)remove:(NSInteger)index;

/**
 * 查看元素的索引
 */
- (NSInteger)indexOf:(id)obj;

/*
 * 检查边界
 */
- (void)rangeCheck:(NSInteger)index;

/*
 *add 检查边界
 */
- (void)rangeCheckForAdd:(NSInteger)index;


/**
 * 获取index位置的节点
 */
- (YHNote *)note:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END

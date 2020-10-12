//
//  YHHeap.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/9/29.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHHeap : NSObject

- (NSInteger)size;
- (BOOL)isEmpty;
- (void)clear;
- (void)add:(id)element;
- (void)addElements:(NSArray *)elements;
// 获取堆顶元素
- (id)get;
// 删除堆顶元素
- (id)remove;
// 删除堆顶元素的同时插入一个新元素
- (id)replace:(id)element;

@end

NS_ASSUME_NONNULL_END

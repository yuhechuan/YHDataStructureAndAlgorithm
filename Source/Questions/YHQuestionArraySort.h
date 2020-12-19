//
//  YHQuestionArraySort.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionArraySort : NSObject


#pragma =============== 数组 排序 ========================
/**
 * 88合并2个有序数组
 */
+ (NSArray *)merge:(NSArray *)num1 num2:(NSArray *)num2;
/**
 *  75 颜色分类
 */
+ (void)colorClassify:(NSMutableArray *)num;

/**
 * 16 部分排序
 */
+ (NSArray *)subSort:(NSArray *)nums;
/**
 *  977 有序数组的平方
 */
+ (NSArray *)sortedSquares:(NSArray *)nums;


@end

NS_ASSUME_NONNULL_END

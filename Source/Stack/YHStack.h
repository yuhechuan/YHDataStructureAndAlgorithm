//
//  YHStack.h
//  算法
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHStack : NSObject

/**
 * 元素的数量
 */
- (NSInteger)size;

/**
 * 是否为空
 */
- (BOOL)isEmpty;

/**
 * 入栈
 */
- (void)push:(id)element;

/**
 * 出栈
 */
- (id)pop;

/**
 * 栈顶元素
 */
- (id)peek;

@end

NS_ASSUME_NONNULL_END

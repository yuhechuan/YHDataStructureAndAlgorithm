//
//  YHBinarySearchTree.h
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBinaryTree.h"
#import "YHComparator.h"
#import "MJBinaryTreeInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHBinarySearchTree : YHBinaryTree<MJBinaryTreeInfo>

/**
 * 添加元素
 */
- (void)add:(id)element;

/**
 * 删除元素
 */
- (void)remove:(id)element;

/**
 * 判断是否包含
 */
- (BOOL)contains:(id)element;

/**
 * 创建新节点
 */

- (YHBNote *)creatNote:(id)element
                parent:(YHBNote *)parent;

- (void)afterAdd:(YHBNote *)note;
- (void)afterRemove:(YHBNote *)note;

@end

NS_ASSUME_NONNULL_END

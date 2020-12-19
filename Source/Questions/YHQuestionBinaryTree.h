//
//  YHQuestionBinaryTree.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YHBNote;

NS_ASSUME_NONNULL_BEGIN

@interface YHQuestionBinaryTree : NSObject

#pragma =============== 二叉树 ========================
/**
 * 236 二叉树的最近公共祖先
 */
+ (YHBNote *)lowestCommonAncestor:(YHBNote *)root
                                p:(YHBNote *)p
                                q:(YHBNote *)q;
/**
 * 99 恢复二叉搜索树
 *  二叉搜搜数 中序遍历是升序的
 */
+ (void)recoverTree:(YHBNote *)root;

/**
 * 333.最大BST子树
 */
+ (int)largestBSTSubtree:(YHBNote *)root;


@end

NS_ASSUME_NONNULL_END

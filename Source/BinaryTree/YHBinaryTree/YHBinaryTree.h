//
//  YHBinaryTree.h
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHBNote.h"
#import "YHVisitor.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 二叉树
 */
@interface YHBinaryTree : NSObject {
    @public
    NSInteger size;
    YHBNote *root;
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
 * 前序遍历
 */
- (void)preorder:(YHVisitor *)visitor;
- (void)preorder:(YHBNote *)note visitor:(YHVisitor *)visitor;

/**
 * 中序遍历
 */
- (void)inorder:(YHVisitor *)visitor;
- (void)inorder:(YHBNote *)note visitor:(YHVisitor *)visitor;

/**
 * 后序遍历
 */
- (void)postorder:(YHVisitor *)visitor;
- (void)postorder:(YHBNote *)note visitor:(YHVisitor *)visitor;


/**
 * 层序遍历
 */
- (void)levelorder:(YHVisitor *)visitor;
- (void)levelorder:(YHBNote *)note visitor:(YHVisitor *)visitor;

/**
 * 是否是完全二叉树
 */
- (BOOL)isComplete;

/**
 * 根节点高度
 */
- (NSInteger)height;

/**
 * 任意根节点高度
 */
- (NSInteger)height:(YHBNote *)note;

/**
 * 前驱节点
 */
- (YHBNote *)predecessor:(YHBNote *)note;

/**
 * 后继根节点
 */
- (YHBNote *)successor:(YHBNote *)note;


@end

NS_ASSUME_NONNULL_END

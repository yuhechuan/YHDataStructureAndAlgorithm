//
//  YHBalanceBinarySearchTree.h
//  算法
//
//  Created by ruaho on 2019/6/14.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBinarySearchTree.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 二叉平衡搜索树
 */
@interface YHBalanceBinarySearchTree : YHBinarySearchTree

/*
 左旋转
 */
- (void)rotateLeft:(YHBNote *)grand;

/*
 右旋转
 */
- (void)rotateRight:(YHBNote *)grand;

/*
 旋转
 */
- (void)rotate:(YHBNote *)r
             b:(YHBNote *)b
             c:(YHBNote *)c
             d:(YHBNote *)d
             e:(YHBNote *)e
             f:(YHBNote *)f;

/*
 旋转封装
 */
- (void)afterRoate:(YHBNote *)grand
            parent:(YHBNote *)parent
             child:(YHBNote *)child;
@end

NS_ASSUME_NONNULL_END

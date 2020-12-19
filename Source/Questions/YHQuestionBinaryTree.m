//
//  YHQuestionBinaryTree.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionBinaryTree.h"
#import "YHBNote.h"

YHBNote *_preNode;
YHBNote *_fristNode;
YHBNote *_secondNode;

/**
 * 最大bst子树的信息
 */
@interface YHNodeInfo : NSObject
// 根节点
@property (nonatomic, strong) YHBNote *root;
// 节点数量
@property (nonatomic, assign) int size;
// 子树里面的最大值
@property (nonatomic, strong) id max;
// 子树里面的最小值
@property (nonatomic, assign) id min;

- (instancetype)initWihtRoot:(YHBNote *)root
                        size:(int)size
                         max:(id)max
                         min:(id)min;

@end

@implementation YHNodeInfo

- (instancetype)initWihtRoot:(YHBNote *)root
                        size:(int)size
                         max:(id)max
                         min:(id)min {
    if (self = [super init]) {
        _root = root;
        _size = size;
        _max = max;
        _min = min;
    }
    return self;
}

@end

@implementation YHQuestionBinaryTree

#pragma mark -- 二叉树
/**
 * 236 二叉树的最近公共祖先
 */
+ (YHBNote *)lowestCommonAncestor:(YHBNote *)root
                                p:(YHBNote *)p
                                q:(YHBNote *)q {
    if (!root || p == root || q == root) {
        return root;
    }
    YHBNote *left = [self lowestCommonAncestor:root->left p:p q:q];
    YHBNote *right = [self lowestCommonAncestor:root->right p:p q:q];
    
    if (left && right) {
        return root;
    }
    return left ? left : right;
}

/**
 * 99 恢复二叉搜索树
 *  二叉搜搜数 中序遍历是升序的
 *  时间O(n)
 *  空间O(h) 输的高度
 */
+ (void)recoverTree:(YHBNote *)root {
    [self findMorrisWrongNodes:root];
    id tmp = _fristNode->element;
    _fristNode->element = _secondNode->element;
    _secondNode->element = tmp;
}

/**
 * 二叉树的Morris遍历 可以达到 时间复杂度O(n)  空间复杂度O(1)
 * 每个节点遍历2次 O(2n)
 */
+ (void)findMorrisWrongNodes:(YHBNote *)root {
    if (!root) {
        return;
    }
    
    YHBNote *N =root;
    while (N) {
        if (N->left) {
            // 找到前驱节点
            YHBNote *pre = N->left;
            while (pre->right && pre->right != N) {
                pre = pre->right;
            }
            
            if (!pre->right) {
                pre->right = N;
                N = N->left;
            } else {
                // 第二次 访问
                [self findNode:root];
                pre->right = nil;
                N = N->right;
            }
        } else {
            [self findNode:root];
            N = N->right;
        }
    }
    
}

/**
 * 获取前驱节点
 */

+ (void)findNode:(YHBNote *)node {
    if (_preNode && [self compare:_preNode->element v2:node->element]) {
        _secondNode = node;
        if (_fristNode) {
            return;
        }
        _fristNode = _preNode;
    }
    _preNode = node;
}


/**
 * 中序遍历 查找逆序对
 */
+ (void)findWrongNodes:(YHBNote *)root {
    if (!root) {
        return;
    }
    [self findWrongNodes:root->left];
    [self findNode:root];
    [self findWrongNodes:root->right];
}

+ (int)compare:(id)v1 v2:(id)v2 {
    int a = [v1 intValue];
    int b = [v2 intValue];
    return a > b;
}

/**
 * 333.最大BST子树
 * 包含所有的子类
 * 返回节点数量
 * 时间复杂度 0(n^2)
 */
+ (int)largestBSTSubtree1:(YHBNote *)root {
    if (!root) {
        return 0;
    }
    
    if ([self isBST:root]) {
        return [self nodeCounts:root];
    }
    
    return MAX([self largestBSTSubtree:root->left], [self largestBSTSubtree:root->right]);
}

+ (BOOL)isBST:(YHBNote *)root {
    return [self isBST:root max:@(INT_MAX) min:@(INT_MIN)];
}

+ (BOOL)isBST:(YHBNote *)root max:(id)max min:(id)min {
    if (!root) {
        return YES;
    }
    BOOL ret = [self compare:root->element v2:min] && [self compare:max v2:root->element] && [self isBST:root->left max:root->element min:min] && [self isBST:root->right max:max min:root->element];
    return ret;
}

+ (int)nodeCounts:(YHBNote *)root {
    if (!root) {
        return 0;
    }
    return 1 + [self nodeCounts:root->left] + [self nodeCounts:root->right];
}

+ (int)largestBSTSubtree:(YHBNote *)root {
    if (!root) {
        return 0;
    }
    YHNodeInfo *info = [self getInfo:root];
    return info.size;
}

/**
 * 返回以root为根节点的最大BST子树的信息
 */
+ (YHNodeInfo *)getInfo:(YHBNote *)root {
    if (!root) {
        return nil;
    }
    
    // 分别获取左右子树的 最大BST子树信息
    YHNodeInfo *li = [self getInfo:root->left];
    YHNodeInfo *ri = [self getInfo:root->right];
    /**
     * 4种情况
     */
    int leftSize = -1;
    int rightSize = -1;
    id min = root->element;
    id max = root->element;

    if (li == nil) {
        leftSize = 0;
    } else if (li.root == root->left && [self compare:root->element v2:li.max]) {
        leftSize = li.size;
        min = li.min;
    }
    
    if (ri == nil) {
        rightSize = 0;
    } else if (ri.root == root->right && [self compare:ri.min v2:root->element]) {
        rightSize = ri.size;
        max = ri.max;
    }
    
    if (leftSize >= 0 && rightSize >= 0 ) {
        return [[YHNodeInfo alloc]initWihtRoot:root size:1 + leftSize + rightSize max:max min:min];
    }
    
    if (li && ri) {
        return li.size > ri.size ? li : ri;
    }
    return li ? li: ri;
}



@end

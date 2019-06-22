//
//  YHBinaryTree.m
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBinaryTree.h"
#import "YHQueue.h"

@implementation YHBinaryTree

/**
 * 清除所有元素
 */
- (void)clear {
    root = nil;
    size = 0;
}

/**
 * 元素的数量
 */
- (NSInteger)size {
    return size;
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
    return size == 0;
}

/**
 * 前序遍历
 */
- (void)preorder:(YHVisitor *)visitor {
    if (visitor == nil) return;
    [self preorder:root visitor:visitor];
}

- (void)preorder:(YHBNote *)note
         visitor:(YHVisitor *)visitor {
    if (note == nil || visitor.isStop) return;
    visitor.isStop = visitor.visit(note->element);
    [self preorder:note->left visitor:visitor];
    [self preorder:note->right visitor:visitor];
}

/**
 * 中序遍历
 */
- (void)inorder:(YHVisitor *)visitor {
    if (visitor == nil) return;
    [self inorder:root visitor:visitor];
}
- (void)inorder:(YHBNote *)note
        visitor:(YHVisitor *)visitor {
    if (note == nil || visitor.isStop) return;
    [self inorder:note->left visitor:visitor];
    visitor.isStop = visitor.visit(note->element);
    [self inorder:note->right visitor:visitor];
}

/**
 * 后序遍历
 */
- (void)postorder:(YHVisitor *)visitor {
    if (visitor == nil) return;
    [self postorder:root visitor:visitor];
}
- (void)postorder:(YHBNote *)note
          visitor:(YHVisitor *)visitor {
    if (note == nil || visitor.isStop) return;
    [self postorder:note->left visitor:visitor];
    [self postorder:note->right visitor:visitor];
    visitor.isStop = visitor.visit(note->element);
}


/**
 * 层序遍历
 */
- (void)levelorder:(YHVisitor *)visitor {
    if (visitor == nil) return;
    [self levelorder:root visitor:visitor];
}
- (void)levelorder:(YHBNote *)note
           visitor:(YHVisitor *)visitor {
    
    YHQueue *queue = [[YHQueue alloc]init];
    [queue enQueue:note];
    
    while (![queue isEmpty]) {
        
        YHBNote *note = [queue deQueue];
        if (visitor.visit(note->element)) return;
        
        if (note->left != nil) {
            [queue enQueue:note->left];
        }
        
        if (note->right != nil) {
            [queue enQueue:note->left];
        }
    }
}

/**
 * 是否是完全二叉树
 */
- (BOOL)isComplete {
    if (root == nil) return NO;
    
    YHQueue *queue = [[YHQueue alloc]init];
    [queue enQueue:root];
    
    BOOL leaf = NO;
    while (![queue isEmpty]) {

        YHBNote *note = [queue deQueue];
        
        if (leaf && ![note isLeaf]) return NO;
        
        if (note->left != nil) {
            [queue enQueue:note->left];
        } else if (note->right != nil) {
            return NO;
        }
        
        if (note->right != nil) {
            [queue enQueue:note->left];
        } else {
            leaf = YES;
        }
    }
    
    return YES;
}

/**
 * 根节点高度
 */
- (NSInteger)height {
    
    NSInteger h = 0;
    NSInteger levelSize = 1;
    
    YHQueue *queue = [[YHQueue alloc]init];
    [queue enQueue:root];
    
    while (![queue isEmpty]) {
        
        YHBNote *note = [queue deQueue];
        levelSize --;
        
        if (note->left != nil) {
            [queue enQueue:note->left];
        }
        
        if (note->right != nil) {
            [queue enQueue:note->left];
        }
        
        if (levelSize == 0) {
            levelSize = [queue size];
            h ++;
        }
    }
    return h;
}

/**
 * 根节点高度
 */
- (NSInteger)heightRecursion {
    return [self height:root];
}

/**
 * 任意根节点高度
 */
- (NSInteger)height:(YHBNote *)note {
    if (root == nil) return 0;
    return 1 + MAX([self height:note->left],[self height:note->right]);
}

/**
 * 前驱节点
 */
- (YHBNote *)predecessor:(YHBNote *)note {
    // left.right.right...
    
    YHBNote *p = note->left;
    if (p != nil) {
        while (p->right != nil) {
            p = p->right;
        }
        return p;
    }
    
    while (note->parent != nil && note == note->parent->left) {
        note = note ->parent;
    }
    
    return note->parent;
}

/**
 * 后继根节点
 */
- (YHBNote *)successor:(YHBNote *)note {
    
    YHBNote *p = note->right;
    if (p != nil) {
        while (p->left != nil) {
            p = p->left;
        }
        return p;
    }
    
    while (note->parent != nil && note == note->parent->right) {
        note = note ->parent;
    }
    
    return note->parent;
}

@end

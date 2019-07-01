//
//  YHRBTree.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/6/25.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHRBTree.h"
#import "YHRBNote.h"

@implementation YHRBTree

// 添加之后x修复红黑树
- (void)afterAdd:(YHBNote *)note {
    YHRBNote *parent = (YHRBNote *)note->parent;
    // 如果是根节点 或者上益到了根节点
    if (parent == nil) {
        [note black];
        return;
    }
    
    // 如果是在黑色节点下添加节点不用做任何处理
    if ([parent isBlack]) return;
    
    YHRBNote *uncle = (YHRBNote *)[parent sibling];
    YHRBNote *grand = (YHRBNote *)[parent->parent red];
    if ([uncle isRed]) { // B树节点上益 当成是新添加的节点
        [parent black];
        [uncle black];
        [self afterAdd:grand];
        return;
    }
    
    // uncle不是红色
    
    if ([parent isLeftChild]) {//L
        if ([note isLeftChild]) { // LL
            [parent black];
        } else {//LR
            [note black];
            [self rotateLeft:parent];
        }
        [self rotateRight:grand];
    } else {
        if ([note isLeftChild]) {//RL
            [note black];
            [self rotateRight:parent];
        } else {//RR
            [parent black];
        }
        [self rotateLeft:grand];
    }
    
}

- (void)afterRemove:(YHBNote *)note {
    // 删除的是红色节点 或者代替的是红色
    if ([note isRed]) {
        [note black];
        return;
    }
    
    // 删除的是父节点 直接删除
    YHRBNote *parent = (YHRBNote *)note->parent;
    if (parent == nil) return;
    
    // 删除的是黑色叶子节点
    // 先拿到叔父节点
    
    BOOL left = parent->left ==nil || [note isLeftChild];
    YHRBNote *sibling = left ? (YHRBNote *)parent->right : (YHRBNote *)parent->left;
    
    if (left) {// 被删除的节点在左边边，兄弟节点在右边
        
        if ([sibling isRed]) {
            // 替换兄弟节点
            [sibling black];
            [parent red];
            [self rotateLeft:parent];
            sibling = (YHRBNote *)parent->right;
        }
        
        // 此时兄弟节点肯定为 黑色
        if ([sibling->left black]&& [sibling->right black]) {
            BOOL blackParent = [parent isBlack];
            [parent black];
            [sibling red];
            if (blackParent) {
                [self afterRemove:parent];
            }
            
        } else {
            // 兄弟节点有子节点 可以借
            if ([sibling->right isBlack]) {
                [self rotateRight:sibling];
                sibling = (YHRBNote *)parent->right;
            }
            
            [sibling color:[parent colorOf]];
            [sibling->right black];
            [parent black];
            [self rotateLeft:parent];
        }
        
    } else {// 被删除的节点在右边，兄弟节点在左边
        if ([sibling isRed]) {
            // 替换兄弟节点
            [sibling black];
            [parent red];
            [self rotateRight:parent];
            sibling = (YHRBNote *)parent->left;
        }
        
        // 此时兄弟节点肯定为 黑色
        if (sibling->left == nil && sibling->right == nil) {
            BOOL blackParent = [parent isBlack];
            [parent black];
            [sibling red];
            if (blackParent) {
                [self afterRemove:parent];
            }
            
        } else {
            // 兄弟节点有子节点 可以借
            if ([sibling->left isBlack]) {
                [self rotateLeft:sibling];
                sibling = (YHRBNote *)parent->left;
            }
            
            [sibling color:[parent colorOf]];
            [sibling->left black];
            [parent black];
            [self rotateRight:parent];
        }
    }
}


- (YHBNote *)creatNote:(id)element
                parent:(YHBNote *)parent {
    YHRBNote *newNote = [[YHRBNote alloc]initWithElement:element
                                                  parent:parent];
    return newNote;
}


/**
 * who is the root node
 */
- (id)root {
    return root;
}
/**
 * how to get the left child of the node
 */
- (id)left:(id)node {
    YHRBNote *noter = (YHRBNote *)node;
    return noter->left;
}
/**
 * how to get the right child of the node
 */
- (id)right:(id)node {
    YHRBNote *noter = (YHRBNote *)node;
    return noter->right;
}
/**
 * how to print the node
 */
- (id)string:(id)node {
    return node;
}


@end

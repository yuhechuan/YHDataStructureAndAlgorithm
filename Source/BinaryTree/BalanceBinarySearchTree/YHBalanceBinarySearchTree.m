//
//  YHBalanceBinarySearchTree.m
//  算法
//
//  Created by ruaho on 2019/6/14.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBalanceBinarySearchTree.h"

@implementation YHBalanceBinarySearchTree

/*
 左旋转
 */
- (void)rotateLeft:(YHBNote *)grand {
    
    YHBNote *parent = grand->right;
    YHBNote *child = parent->left;
    parent->left = grand;
    grand->right = child;
    
    [self afterRoate:grand
              parent:parent
               child:child];
}

/*
 右旋转
 */
- (void)rotateRight:(YHBNote *)grand {
    YHBNote *parent = grand->left;
    YHBNote *child = parent->right;
    parent->right = grand;
    grand->left = child;
    
    [self afterRoate:grand
              parent:parent
               child:child];
}


- (void)afterRoate:(YHBNote *)grand
            parent:(YHBNote *)parent
             child:(YHBNote *)child {
    parent->parent = grand->parent;
    
    if ([grand isLeftChild]) {
        grand->parent->left = parent;
    } else if ([grand isRightChild]) {
        grand->parent->right = parent;
    } else {
        root = parent;
    }
    
    if (child != nil) {
        child->parent = grand;
    }
    
    grand->parent = parent;
}
/*
 旋转
 */

- (void)rotate:(YHBNote *)r  //树的跟节点
             b:(YHBNote *)b
             c:(YHBNote *)c
             d:(YHBNote *)d
             e:(YHBNote *)e
             f:(YHBNote *)f {
    
    // 让d 成为这棵树的根节点
    d->parent = r->parent;
    if ([r isLeftChild]) {
        r->parent->left = d;
    } else if ([r isRightChild]) {
        r->parent->right = d;
    } else {
        root = d;
    }
    
    // b-c
    b->right = c;
    if (c != nil) c->parent = d;
    
    //e-f
    f->left = e;
    if (e != nil) e->parent = f;
    
    // b-d-f
    d->left = b;
    d->right = f;
    b->parent = d;
    f->parent = d;
    
}


@end

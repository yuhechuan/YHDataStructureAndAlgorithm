//
//  YHAVLTree.m
//  算法
//
//  Created by ruaho on 2019/6/14.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHAVLTree.h"
#import "YHAVLNote.h"

@implementation YHAVLTree

/*
 添加之后的调整
 */
-(void)afterAdd:(YHBNote *)note {
    
    while ((note = note->parent) != nil) {
        if ([self isBalance:note]) {
            [self updateHeight:note];
        } else {
            [self rebalance:note];
            break;
        }
    }
}

/*
 删除之后的调整
 */
- (void)afterRemove:(YHBNote *)note {
    while ((note = note->parent) != nil) {
        if ([self isBalance:note]) {
            [self updateHeight:note];
        } else {
            [self rebalance:note];
        }
    }
}

/*
 回复平衡
 */
- (void)rebalance:(YHBNote *)note {
    YHAVLNote *grand = (YHAVLNote *)note;
    YHAVLNote *parent = (YHAVLNote *)[grand tallerChild];
    YHAVLNote *child = (YHAVLNote *)[parent tallerChild];
    
    if ([parent isLeftChild]) {
        if ([child isLeftChild]) {
            // LL
            [self rotateRight:note];
        } else {
            // LR
            [self rotateLeft:parent];
            [self rotateRight:note];
        }
    } else {
        if ([child isLeftChild]) {
            //RL
            [self rotateRight:parent];
            [self rotateLeft:note];
            
        } else {
            // RR
            [self rotateLeft:note];
        }
    }
}

/*
 平衡因子小于等于1
 */
- (BOOL)isBalance:(YHBNote *)note {
    YHAVLNote *avl = (YHAVLNote *)note;
    return abs([avl balanceFactor]) <= 1;
}

// @Override
- (void)afterRoate:(YHBNote *)grand
            parent:(YHBNote *)parent
             child:(YHBNote *)child {
    [super afterRoate:grand
               parent:parent
                child:child];
    [self updateHeight:grand];
    [self updateHeight:parent];
}

//@Override
- (void)rotate:(YHBNote *)r
             b:(YHBNote *)b
             c:(YHBNote *)c
             d:(YHBNote *)d
             e:(YHBNote *)e
             f:(YHBNote *)f {
    [super rotate:r b:b c:c d:d e:e f:f];
    [self updateHeight:b];
    [self updateHeight:f];
    [self updateHeight:d];
}

- (void)updateHeight:(YHBNote *)note {
    YHAVLNote *avl = (YHAVLNote *)note;
    [avl updateHeight];
}

- (YHBNote *)creatNote:(id)element parent:(YHBNote *)parent {
    YHAVLNote *newNote = [[YHAVLNote alloc]initWithElement:element parent:parent];
    return newNote;
}

@end

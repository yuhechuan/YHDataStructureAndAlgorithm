//
//  YHBinarySearchTree.m
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBinarySearchTree.h"

@implementation YHBinarySearchTree {
    YHComparator *comparator;
}

- (instancetype)initWithComparator:(YHComparator *)comparator {
    if (self = [super init]) {
        comparator = comparator;
    }
    return self;
}

/**
 * 添加元素
 */
- (void)add:(id)element {
    [self elementNotNullCheck:element];
    if (root == nil) {
        root = [self creatNote:element parent:nil];
        size ++;
        [self afterAdd:root];
        return;
    }
    
    YHBNote *note = root;
    YHBNote *parent = root;

    int cmp = 0;
    while (note != nil) {
        cmp = [self compare:element b:note->element];
        parent = note;
        if (cmp > 0) {
            note = note ->right;
        } else if (cmp < 0) {
            note = note ->left;
        } else {
            note->element = element;
            return;
        }
    }
    
    YHBNote *newNote = [self creatNote:element parent:parent];
    
    if (cmp > 0) {
        parent ->right = newNote;
    } else {
        parent ->left = newNote;
    }
    
    size ++;
    [self afterAdd:newNote];
}

/**
 * 创建新节点
 */
- (YHBNote *)creatNote:(id)element
                parent:(YHBNote *)parent {
    YHBNote *newNote = [[YHBNote alloc]initWithElement:element parent:parent];
    return newNote;
}

/**
 * 删除元素
 */
- (void)remove:(id)element {
    [self removeNote:[self note:element]];
}

- (void)removeNote:(YHBNote *)note {
    if (note == nil) return;
    size--;
    
    if ([note hasTwoChild]) {
        YHBNote *s = [self successor:note];
        note->element = s->element;
        note = s;
    }
    
    YHBNote *replacement = note->left ? note->left : note->right;
    if (replacement != nil) {
        replacement->parent = note->parent;
        if (note->parent == nil) {
            root = replacement;
        } else if (note == note ->parent->left) {
            note ->parent->left = replacement;
        } else {
            note ->parent->right = replacement;
        }
        [self afterRemove:replacement];
    } else if (note->parent == nil) {
        root = nil;
        [self afterRemove:note];
    } else {
        if (note == note->parent->left) {
            note->parent->left = nil;
        } else { // node == node.parent.right
            note->parent->right = nil;
        }
        [self afterRemove:note];
    }
}

/**
 * 判断是否包含
 */
- (BOOL)contains:(id)element {
    return [self note:element] ? YES : NO;
}

- (YHBNote *)note:(id)element {
    YHBNote *note = root;
    int cmp = 0;
    while (note != nil) {
        cmp = [self compare:element b:note->element];
        if (cmp > 0) {
            note = note ->right;
        } else if (cmp < 0) {
            note = note ->left;
        } else {
            return note;
        }
    }
    return nil;
}

- (int)compare:(id)a
             b:(id)b {
    if (comparator != nil) {
        return comparator.compare(a,b);
    }
    return [a compare:b];
}


- (void)elementNotNullCheck:(id)element {
    if (element == nil) {
        @throw [NSException exceptionWithName:@"out of bounds" reason:@"element must not be null" userInfo:nil];
    }
}


- (void)afterAdd:(YHBNote *)note {/*@"子类实现" */};
- (void)afterRemove:(YHBNote *)note {/*@"子类实现" */};


- (id)root {
    return root;
}
/**
 * how to get the left child of the node
 */
- (id)left:(YHBNote *)node {
    return node->left;
}
/**
 * how to get the right child of the node
 */
- (id)right:(YHBNote *)node {
    return node->right;
}
/**
 * how to print the node
 */
- (id)string:(YHBNote *)node {
    return node->element;
}

@end

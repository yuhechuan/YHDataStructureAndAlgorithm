//
//  YHDoubleLinked.m
//  算法
//
//  Created by ruaho on 2019/5/24.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHDoubleLinked.h"


/*
 * 双向链表
 */

@implementation YHDoubleLinked


- (void)addObject:(id)object atIndex:(NSInteger)index {
    [self rangeCheckForAdd:index];
    if (index == size) {
        YHNote *oldLast = last;
        // 改变 frist指向新节点 , 新元素指向frist指向的节点
        last = [[YHNote alloc]initWithPrev:oldLast element:object next:nil];
        if (!oldLast) {
            frist = last;
        } else {
            oldLast->next = last;
        }
    } else {
        YHNote *next = [self note:index];
        YHNote *pre = next->prev;
        YHNote *current = [[YHNote alloc]initWithPrev:pre element:object next:pre];
        next->prev = current;
        if (!pre) {
            frist = current;
        } else {
            pre->next = current;
        }
    }
    size ++;
}

- (id)remove:(NSInteger)index {
    [self rangeCheck:index];
    
    YHNote *current = [self note:index];
    YHNote *pre = current->prev;
    YHNote *next =current->next;
    
    if (pre == nil) {
        frist = next;
    } else {
        pre->next = next;
    }
    
    if (next == nil) {
        last = pre;
    } else {
        next->prev = pre;
    }
    
    size --;
    return current->element;
}


/**
 * 获取index位置的节点
 */
- (YHNote *)note:(NSInteger)index {
    [self rangeCheck:index];
    
    YHNote *note = nil;
    if (index < (size >> 1)) {  // 右移一位 /2
        note = frist;
        for (NSInteger i = 0; i < index; i ++) {
            note = note ->next;
        }
    } else {
        note = last;
        for (NSInteger i = size - 1; i >index; i --) {
            note = note ->prev;
        }
    }
    return note;
}


@end

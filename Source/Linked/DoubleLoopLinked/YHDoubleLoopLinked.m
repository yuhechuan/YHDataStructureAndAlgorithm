//
//  YHDoubleLoopLinked.m
//  算法
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHDoubleLoopLinked.h"

/*
 * 双向循环链表
 */

@implementation YHDoubleLoopLinked

- (void)addObject:(id)object atIndex:(NSInteger)index {
    
    if (index == size) {
        YHNote *oldLast = last;
        // 改变 frist指向新节点 , 新元素指向frist指向的节点
        last = [[YHNote alloc]initWithPrev:oldLast element:object next:frist];
        if (oldLast == nil) {
            frist = last;
            frist->next = last;
            frist->prev = last;
        } else {
            frist->prev = last;
            oldLast->next = last;
        }
    } else {
        YHNote *next = [self note:index];
        YHNote *pre = next->prev;
        YHNote *current = [[YHNote alloc]initWithPrev:pre element:object next:pre];
        next->prev = current;
        pre->next = current;
        if (next == frist) {
            frist = current;
        }
    }
    size ++;
}

- (id)remove:(NSInteger)index {
    [self rangeCheck:index];
    YHNote *current = [self note:index];
    return [self removeNote:current];
}

- (id)removeNote:(YHNote *)note {
    if (size == 1) {
        frist = nil;
        last = nil;
    } else {
        YHNote *pre = note->prev;
        YHNote *next =note->next;
        pre->next = next;
        next->prev = pre;
        
        if (note == frist) {
            frist = next;
        }
        if (note == last) {
            last = pre;
        }
    }
    size --;
    return note->element;
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


- (NSString *)description {
    return [super description];
}

@end

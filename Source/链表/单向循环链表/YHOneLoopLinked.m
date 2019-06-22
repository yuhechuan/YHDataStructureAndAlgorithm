//
//  YHOneLoopLinked.m
//  算法
//
//  Created by ruaho on 2019/5/22.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHOneLoopLinked.h"

/*
 * 单向循环链表
 */
@implementation YHOneLoopLinked


/**
 * 在index位置插入一个元素
 */
- (void)addObject:(id)object atIndex:(NSInteger)index {
    [self rangeCheckForAdd:index];
    if (index == 0) {
        // 创建j新节点  并赋予指向
        YHNote *newNote = [[YHNote alloc]initWithElement:object next:frist];
        frist = newNote;
        // 拿到最后一个节点
        YHNote *last = size == 0 ?frist:[self note:size-1];
        // 改变最后一个节点指向
        last->next = newNote;
        // frist 重新赋值
    } else {
        // 拿到上一个节点 并且让上上一个节点的next指针指向新节点,
        // 新节点next指针指向上一个节点next指向的节点
        YHNote *pre = [self note:index - 1];
        pre->next = [[YHNote alloc]initWithElement:object next:pre->next];
    }
    size ++;
}

/**
 * 删除index位置的元素
 */
- (id)remove:(NSInteger)index {
    YHNote *note = frist;
    if (index == 0) {
        if (size == 1) {
            frist = nil;
        } else {
            YHNote *last = [self note:size -1];
            frist = frist->next;
            last->next = frist;
        }
    } else {
        YHNote *pre = [self note:index -1];
        note = pre->next;
        pre->next = note->next;
    }
    
    size --;
    return note->element;
}

/**
 * 获取index位置的节点
 */
- (YHNote *)note:(NSInteger)index {
    [self rangeCheck:index];
    YHNote *note = frist;
    for (int i = 0; i< index; i ++) {
        note = note ->next;
    }
    return note;
}



@end

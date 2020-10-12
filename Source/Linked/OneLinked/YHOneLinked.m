//
//  YHOneLinked.m
//  算法
//
//  Created by ruaho on 2019/5/22.
//  Copyright © 2019 玉河川. All rights reserved.
//

/*
 * 单向链表
 */
#import "YHOneLinked.h"

@implementation YHOneLinked

/**
 * 在index位置插入一个元素
 */
- (void)addObject:(id)object atIndex:(NSInteger)index {
    [self rangeCheckForAdd:index];
    if (index == 0) {
        // 改变 frist指向新节点 , 新元素指向frist指向的节点
        frist = [[YHNote alloc]initWithElement:object next:frist];
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
        frist = frist->next;
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

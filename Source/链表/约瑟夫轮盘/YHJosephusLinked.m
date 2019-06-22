//
//  YHJosephusLinked.m
//  YHLinkedList
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 ruaho. All rights reserved.
//

#import "YHJosephusLinked.h"

/*
 * 解决约瑟夫问题的链表
 */

@implementation YHJosephusLinked


/*
 *current 指向头结点
 */
- (void)reset {
    current = frist;
}

/*
 *current向前走几部
 */
- (id)next:(NSInteger)steps {
    if (current == nil) {
        return nil;
    }
    for (int i = 0; i< steps; i++) {
        current = current->next;
    }
    return current->element;
}


/*
 *删除current节点,并让current 指向下一节点
 */
- (id)removeCurrent {
    
    if (current == nil) {
        return nil;
    }
    
    YHNote *next = current->next;
    id element =  [self removeNote:current];
    if (size == 0) {
        current = nil;
    }else {
        current = next;
    }
    return element;
}


@end

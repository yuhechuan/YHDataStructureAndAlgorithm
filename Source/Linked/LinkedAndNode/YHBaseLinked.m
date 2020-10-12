//
//  YHBaseLinked.m
//  算法
//
//  Created by ruaho on 2019/5/22.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBaseLinked.h"

@implementation YHBaseLinked

/**
 * 清除所有元素
 */
- (void)clear {
    size = 0;
    frist = nil;
    last = nil;
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
 * 是否包含某个元素
 */
- (BOOL)contains:(id)element {
    return [self indexOf:element] >= 0;
}


/**
 * 设置index位置的元素
 * @return 原来的元素ֵ
 */
- (id)setObject:(id)obj atIndex:(NSInteger)index {
    YHNote *note = [self note:index];
    id oldElement = note ->element;
    note->element = obj;
    return oldElement;
}

/**
 * 获取index位置的元素
 */
- (id)get:(NSInteger)index {
    return [self note:index]->element;
}


/**
 * 添加元素到尾部
 */
- (void)add:(id)element {
    [self addObject:element atIndex:size];
}


/**
 * 查看元素的索引
 */
- (NSInteger)indexOf:(id)obj {
    YHNote *note = frist;
    for (int i = 0; i < size; i++) {
        if ([note ->element isEqual:obj]) return i;
        note = note->next;
    }
    return ELEMENT_NOT_FOUND;
}


- (void)rangeCheck:(NSInteger)index {
    if (index < 0 || index >= size) {
        [self outOfBounds:index];
    }
}

- (void)rangeCheckForAdd:(NSInteger)index {
    if (index < 0 || index > size) {
        [self outOfBounds:index];
    }
}


- (void)outOfBounds:(NSInteger)index {
    @throw [NSException exceptionWithName:@"out of bounds" reason:[NSString stringWithFormat:@"Index: %ld Size:%lu",(long)index,(unsigned long)size] userInfo:nil];
}

- (NSString *)description {
    NSMutableString *d = [NSMutableString string];
    [d appendFormat:@"size = %ld,[",size];
    YHNote *note = frist;
    for (int i = 0; i< size; i ++) {
        if (i > 0) {
            [d appendString: @","];
        }
        [d appendFormat:@"%@",note->element];
        note = note->next;
    }
    [d appendString: @"]"];
    return [d copy];
}

@end

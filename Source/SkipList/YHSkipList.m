//
//  YHSkipList.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/7.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHSkipList.h"

#define ARC4RANDOM_MAX      0x100000000

static const int MAX_LEVEL = 32;
static const float P = 0.25;

@interface YHSkipNode : NSObject

@property (nonatomic, strong) id<NSCopying>key;
@property (nonatomic, strong) NSObject *value;
@property (nonatomic, strong) NSMutableArray <YHSkipNode *>*nexts;

@end

@implementation YHSkipNode

- (instancetype)initKey:(id<NSCopying>)key
                  value:(NSObject *)value
                  level:(int)level {
    if (self = [super init]) {
        _key = key;
        _value = value;
        for (int i = 0; i < level; i ++) {
            [self.nexts addObject:[YHSkipNode new]];
        }
    }
    return self;
}

- (NSMutableArray<YHSkipNode *> *)nexts {
    if (!_nexts) {
        _nexts = [NSMutableArray arrayWithCapacity:MAX_LEVEL];
    }
    return _nexts;
}

@end

@interface YHSkipList ()

@property (nonatomic, strong) YHSkipComparator *comparator;

@end

@implementation YHSkipList {
    NSInteger _size;
    int _level;
    YHSkipNode *_first; // 不存放任何 key value
}

- (instancetype)initWithComparator:(YHSkipComparator *)comparator {
    if (self = [super init]) {
        _comparator = comparator;
        _first = [[YHSkipNode alloc]initKey:nil value:nil level:MAX_LEVEL];
    }
    return self;
}

/**
 * 元素的数量
 */
- (NSInteger)size {
    return _size;
}

/**
 * 是否为空
 */
- (BOOL)isEmpty {
    return _size == 0;
}

- (NSObject *)put:(id<NSCopying>)key value:(NSObject *)value {
    [self keyCheck:key];
    YHSkipNode *node = _first;
    int level = _level;
    // 前面向下 走的时候的前驱
    NSMutableArray <YHSkipNode *>*prevs = [NSMutableArray array];
    
    for (int i = level - 1; i >= 0; i --) {
        int cmp = -1;
        while (node.nexts[i].key && (cmp = ([self compare:key key2:node.nexts[i].key]) > 0)) {
           node = node.nexts[i];
        }
        // 之前存在这个节点
        if (cmp == 0) {
            NSObject *oldValue = node.nexts[i].value;
            node.nexts[i].value = value;
            return oldValue;
        }
        [prevs insertObject:node atIndex:0];
    }
    // 不能再往下走了
    int newlevel = [self randomLevel];
    YHSkipNode *newNode = [[YHSkipNode alloc]initKey:key value:value level:newlevel];
    _size ++;
    // 设置前驱
    for (int i = 0; i < newlevel; i ++) {
        if (i >= level) {
            _first.nexts[i] = newNode;
            continue;
        }
        newNode.nexts[i] = prevs[i].nexts[i];
        prevs[i].nexts[i] = newNode;
    }
    
    _level = MAX(_level, newlevel);
    
    return value;
}
/**
 * 获取元素
 */
- (NSObject *)get:(id<NSCopying>)key {
    [self keyCheck:key];
    
    YHSkipNode *node = _first;
    int level = _level;
    
    for (int i = level - 1; i >= 0; i --) {
        int cmp = -1;
        while (node.nexts[i].key && (cmp = [self compare:key key2:node.nexts[i].key]) > 0) {
            node = node.nexts[i];
        }
        if (cmp == 0) {
            return node.nexts[i].value;
        }
    }
    return nil;
}
/**
 * 删除元素
 */
- (NSObject *)remove:(id<NSCopying>)key {
    [self keyCheck:key];
    YHSkipNode *node = _first;
    int level = _level;
    // 前面向下 走的时候的前驱
    NSMutableArray <YHSkipNode *>*prevs = [NSMutableArray array];
    BOOL isExist = NO;
    for (int i = level - 1; i >= 0; i --) {
        int cmp = -1;
        while (node.nexts[i].key && (cmp = ([self compare:key key2:node.nexts[i].key]) > 0)) {
           node = node.nexts[i];
        }
        [prevs insertObject:node atIndex:0];
        if (cmp == 0) {
            isExist = YES;
        }
    }
    
    if (!isExist) {
        return nil;
    }
    _size--;
    YHSkipNode *removeNode = node.nexts[0];
    NSObject *oldValue = removeNode.value;
    
    for (int i = 0; i < removeNode.nexts.count; i ++) {
        prevs[i].nexts[i] = removeNode.nexts[i];
    }
    
    int newlevel = _level;
    while ((-- newlevel) >= 0 && _first.nexts[newlevel].key == nil) {
        level = newlevel;
    }
    return oldValue;
}

/**
 * 比较两个key 的大小
 */
- (int)compare:(id<NSCopying>)key1
          key2:(id<NSCopying>)key2 {
    int result = self.comparator ? self.comparator.compare(key1,key2) : 0;
    return result;
}
/**
 * 获取一个随机层数
 */
- (int)randomLevel {
    int level = 1;
    while (((double)arc4random() / ARC4RANDOM_MAX) < P && level < MAX_LEVEL) {
        level ++;
    }
    return level;
}

/**
 * 检查可以
 */
- (void)keyCheck:(id<NSCopying>)key {
    if (key == nil) {
        @throw [NSException exceptionWithName:@"key"
                                       reason:@"非法的参数传输"
                                              userInfo:nil];
    }
}

- (NSString *)description {
    NSMutableString *sb = [NSMutableString string];
    [sb appendFormat:@"一共有 %d 层",_level];
    [sb appendString:@"\n"];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = _level - 1; i >= 0; i --) {
        YHSkipNode *node = _first;
        NSMutableArray *arr1 = [NSMutableArray array];
        while (node.nexts[i].key) {
            [arr1 addObject:node.nexts[i].key];
            node = node.nexts[i];
        }
        [arr addObject:[arr1 componentsJoinedByString:@"  "]];
    }
    NSString *last = [arr componentsJoinedByString:@"\n"];
    [sb appendString:last];
    return sb;
}

@end


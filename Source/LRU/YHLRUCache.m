//
//  YHLRUCache.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/12/24.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHLRUCache.h"

@interface YHLRUNode : NSObject

@property (nonatomic, strong) YHLRUNode *next;
@property (nonatomic, strong) YHLRUNode *prev;
@property (nonatomic, strong) id value;
@property (nonatomic, strong) id<NSCopying> key;

- (instancetype)initKey:(id<NSCopying>)key value:(id)value;

@end

@implementation YHLRUNode

- (instancetype)initKey:(id<NSCopying>)key value:(id)value {
    if (self = [super init]) {
        _key = key;
        _value = value;
    }
    return self;
}

@end

@interface YHLRUCache ()
 /**
  * 缓存容量
  */
@property (nonatomic, assign) int capacity;
/**
 * 缓存容器
 */
@property (nonatomic, strong) NSMutableDictionary *cache;
/**
 * 虚拟头结点
 */
@property (nonatomic, strong) YHLRUNode *frist;
/**
 * 虚拟尾结点
 */
@property (nonatomic, strong) YHLRUNode *last;

@end

@implementation YHLRUCache

- (instancetype)init {
    return [self initWithCapacity:100];
}

- (instancetype)initWithCapacity:(int)capacity {
    if (self = [super init]) {
        _capacity = capacity;
        self.frist.next = self.last;
        self.last.prev = self.frist;
    }
    return self;
}

/**
 * 向缓存中加入缓存一个元素
 */
- (void)put:(id<NSCopying>)key value:(id)value {
    
    if (!key || !value) {
        return;
    }
    
    YHLRUNode *node = self.cache[key];
    if (node) {
        node.value = value;
        [self removeNode:node];
        [self addAfterFrist:node];
        return;
    }
    // 如果容量已经满了
    if (self.cache.count == self.capacity) {
        YHLRUNode *lastNode = self.last.prev;
        [self.cache removeObjectForKey:lastNode.key];
        [self removeNode:lastNode];
    }
    
    // 添加新节点
    YHLRUNode *newNode = [[YHLRUNode alloc]initKey:key value:value];
    self.cache[key] = newNode;
    [self addAfterFrist:newNode];
}

/**
 * 获取缓存一个元素
 */
- (id)get:(id<NSCopying>)key {
    if (!key) {
        return nil;
    }
    YHLRUNode *node = self.cache[key];
    // 访问了节点
    if (node) {
        [self removeNode:node];
        [self addAfterFrist:node];
    }
    return node.value;
}

/**
 * 清空缓存
 */
- (void)clearAllCache {
    [self.cache removeAllObjects];
    self.frist.next = self.last;
    self.last.prev = self.frist;
}

/**
 * 从双向链表中删除 node结点
 */
- (void)removeNode:(YHLRUNode *)node {
    node.next.prev = node.prev;
    node.prev.next = node.next;
}

/**
 * 把结点提到最前面
 */
- (void)addAfterFrist:(YHLRUNode *)node {
    // 先连接后面那两条线
    self.frist.next.prev = node;
    node.next = self.frist.next;
    
    // 再连接前面那两条线
    self.frist.next = node;
    node.prev = self.frist;
}

- (NSMutableDictionary *)cache {
    if (!_cache) {
        _cache = [NSMutableDictionary dictionary];
    }
    return _cache;
}

- (YHLRUNode *)frist {
    if (!_frist) {
        _frist = [[YHLRUNode alloc]init];
    }
    return _frist;
}

- (YHLRUNode *)last {
    if (!_last) {
        _last = [[YHLRUNode alloc]init];
    }
    return _last;
}

@end

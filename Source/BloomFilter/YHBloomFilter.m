//
//  YHBloomFilter.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/4.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHBloomFilter.h"

@implementation YHBloomFilter {
    int _bitSize;
    int _hashSize;
    long *_bits;
}

- (instancetype)initScale:(int)n
                     rate:(double)p {
    if (self = [super init]) {
        [self setUpScale:n rate:p];
    }
    return self;
}

- (void)setUpScale:(int)n
              rate:(double)p  {
    if (n <= 0 || p <= 0 || p >= 1) {
        @throw [NSException exceptionWithName:@"布隆过滤器"
                                       reason:@"非法的参数值"
                                       userInfo:nil];
    }
    
    double ln2 = log(2);
    // 求出二进制向量的长度
    _bitSize = (int)(- (n * log(p)) / (ln2 *ln2));
    // 求出哈希函数的个数
    _hashSize = (int)_bitSize *ln2 / n;
    
    //二进制向量
    int longs = sizeof(long) * 8;
    int size = (_bitSize + longs -1) / longs;
    _bits = (long *)malloc(size * sizeof(long));
    
    NSLog(@"bitSize = %d  hashSize = %d",_bitSize,_hashSize);
}

/**
 * 添加元素
 */
- (void)put:(NSObject *)value {
    if (!value) {
        return;
    }
    __weak typeof(self) weakself = self;
    [self hashMathod:value result:^BOOL(int indexp) {
        [weakself setBit:indexp];
        return NO;
    }];
   
}

/**
 * 是否包含
 */
- (BOOL)contains:(NSObject *)value {
    if (!value) {
        return NO;
    }
    __weak typeof(self) weakself = self;
    __block BOOL ret = YES;
    [self hashMathod:value result:^BOOL(int indexp) {
        if (![weakself getBit:indexp]) {
            ret = NO;
            return YES;
        }
        return NO;
    }];
    return ret;
}

- (void)hashMathod:(NSObject *)value
            result:(BOOL(^)(int indexp))result {
    unsigned int hash1 = (unsigned int)value.hash;
    // 无符号右移16位
    unsigned int hash2 = hash1 >> 16;

    for (int i = 1; i <= _hashSize ; i ++) {
       int combinHash = hash1 + (hash2 * i);
       if (combinHash < 0) {
           combinHash = - combinHash;
       }
       int index = combinHash % _bitSize;
        if (result) {
            if (result(index)) {
                break;
            };
        }
    }
}
/**
 * 改变二进制向量 一个索引的一位为1
 */
- (void)setBit:(int)index {
    // 数组index
    int realIndex = index / 64;
    // 取出数组里面的一个long
    long value = _bits[realIndex];
    
    // 算出 long里面的第几位
    int subIndex = index % 64;
    value |= (1 << subIndex);
    _bits[realIndex] = value;
}
/**
 * 查看index 位的二进制位
 */
- (BOOL)getBit:(int)index {
    // 数组index
    int realIndex = index / 64;
    // 取出数组里面的一个long
    long value = _bits[realIndex];
    // 算出 long里面的第几位
    int subIndex = index % 64;
    int r = value & (1 << subIndex);
    return r;
}


@end

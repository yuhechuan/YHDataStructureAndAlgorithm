//
//  YHSequence.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/10.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHSequence.h"

@implementation YHSequence
/**
 * 时间复杂度O( (n - m + 1) *m)   ~ n*m
 */
- (int)indexOf1:(NSString *)text
       pattern:(NSString *)pattern {
    int tlen = (int)text.length;
    int plen = (int)pattern.length;
    if (!text || !pattern || tlen == 0 || plen == 0 || plen > tlen) {
        return -1;
    }
   
    int ti = 0;
    int pi = 0;
    //  ti - pi  正在匹配的子串的 起始位置
    // tlen - plen 临界值
    while (pi < plen && ti - pi <= tlen - plen ) {
        NSString *c = [pattern substringWithRange:NSMakeRange(pi, 1)];
        NSString *b = [text substringWithRange:NSMakeRange(ti, 1)];
        if ([c isEqualToString:b]) {
            pi ++;
            ti ++;
        } else {
            ti = ti - pi + 1;
            pi = 0;
        }
    }
    return pi == plen ? ti - pi : -1;
}

- (int)indexOf2:(NSString *)text
        pattern:(NSString *)pattern {
    int tlen = (int)text.length;
    int plen = (int)pattern.length;
    if (!text || !pattern || tlen == 0 || plen == 0 || plen > tlen) {
       return -1;
    }

    int ti = 0;
    int pi = 0;
    while (pi < plen && ti <= tlen - plen ) {
        NSString *c = [pattern substringWithRange:NSMakeRange(pi, 1)];
        NSString *b = [text substringWithRange:NSMakeRange(ti + pi, 1)];
        if ([c isEqualToString:b]) {
            pi ++;
        } else {
            ti ++;
            pi = 0;
        }
    }
    
    return pi == plen ? ti : -1;
}

/**
 * KMP 算法
 * 时间复杂度 最坏O(n + m)  最好O(m)
 * 空间复杂度O (m)
 */
- (int)indexOf:(NSString *)text
    pattern:(NSString *)pattern {
    int tlen = (int)text.length;
    int plen = (int)pattern.length;
    if (!text || !pattern || tlen == 0 || plen == 0 || plen > tlen) {
       return -1;
    }
    
    int ti = 0;
    int pi = 0;
    
    NSArray *next = [self next:pattern];
    
    while (pi < plen && ti - pi <= tlen - plen ) {
       NSString *c = [pattern substringWithRange:NSMakeRange(pi, 1)];
       NSString *b = [text substringWithRange:NSMakeRange(ti, 1)];
       if (pi < 0 || [c isEqualToString:b]) {
           pi ++;
           ti ++;
       } else {
           pi = [next[pi] intValue];
       }
    }
    return pi == plen ? ti - pi : -1;
}
// 构建一个next表
- (NSArray *)next:(NSString *)pattern {
    NSMutableArray *nexts = [NSMutableArray array];
    int i= 0;
    nexts[0] = @(-1);
    int n = -1;
    int iMax = (int)pattern.length -1;
    while (i < iMax) {
        NSString *c = [pattern substringWithRange:NSMakeRange(i, 1)];
        NSString *b = [pattern substringWithRange:NSMakeRange(n, 1)];
        if (n < 0 || [c isEqualToString:b]) {
            ++i;
            ++n;
            NSString *c1 = [pattern substringWithRange:NSMakeRange(i, 1)];
            NSString *b2 = [pattern substringWithRange:NSMakeRange(n, 1)];
            if ([c1 isEqualToString:b2]) {
                nexts[i] = nexts[n];
            } else {
                nexts[i] = @(n);
            }
        } else {
            n = [nexts[n] intValue];
        }
    }
    return nexts;
}


@end

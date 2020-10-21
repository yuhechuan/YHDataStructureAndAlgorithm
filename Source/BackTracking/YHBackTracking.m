//
//  YHBackTracking.m
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/10/20.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHBackTracking.h"

@implementation YHBackTracking {
    NSMutableArray *_cols;
    // 标记这某一列 是否有皇后
    NSMutableArray *_colb;
    NSMutableArray *_leftTop;
    NSMutableArray *_rightTop;
    int _ways;
    
    // 压缩成 1个字节和2个字节
    Byte _byte;
    UInt16 _leftByte;
    UInt16 _rightByte;
}


//1. 树和图的 深度优先搜索  dfs

/**
 * 回溯法
 * 八皇后问题
 * 在8x8格国际象棋上摆上8个皇后 使其不能互相攻击  即:任意两个皇后不能处在同一行,同一列和同一斜线上
 */
- (void)placeQueen:(int)n {
    if (n < 1) {
        return;
    }
    _ways = 0;
    _cols = [NSMutableArray array];
    for (int i = 0; i < n; i ++) {
        _cols[i] = @(-1);
    }
    [self place:0];
    NSLog(@"%d一共有多少种%d摆法",n,_ways);
}

/**
 * 从第 row 行开始摆皇后
 */
- (void)place:(int)row {
    int clos = (int)_cols.count;
    if (row == clos) {
        _ways ++;
        [self showQueen];
        return;
    }
    for (int col = 0; col < clos; col ++) {
        if ([self isValided:row col:col]) {
            _cols[row] = @(col);
            [self place:row +1];
        }
    }
}

/**
 * 判断 第row行第 col列的格子是否可以摆皇后 剪枝操作
 */
- (BOOL)isValided:(int)row col:(int)col {
    for (int i = 0; i < row; i ++) {
        // 判断单前列是否有皇后
        if ([_cols[i] intValue] == col) {
            return NO;
        }
        // 判断斜线 数学斜率 我的x减去你的x  我的y减去你的y 绝对值相等
        if ((row - i) == abs(col - [_cols[i] intValue])) {
            return NO;
        }
    }
    return YES;
}

- (void)showQueen {
    int count = (int)_cols.count;
    for (int i = 0; i < count; i ++) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int j = 0; j < count; j ++) {
            NSString *bianji = [_cols[i] intValue] == j ? @"1" :@"0";
            [arr addObject:bianji];
        }
        NSLog(@"%@",[arr componentsJoinedByString:@"  "]);
    }
    NSLog(@"============================");
}

/**
 * 简化
 */
- (void)placeQueen1:(int)n {
    if (n < 1) {
        return;
    }
    _ways = 0;
    // 列
    _colb = [NSMutableArray array];
    for (int i = 0; i < n; i ++) {
        _colb[i] = @(NO);
    }
    
    int biasCount = (n << 1) -1;
    
    // 从左朝右的斜线
    _leftTop = [NSMutableArray array];
    for (int i = 0; i < biasCount; i ++) {
        _leftTop[i] = @(NO);
    }
    // 从右朝左的斜线
    _rightTop = [NSMutableArray array];
    for (int i = 0; i < biasCount; i ++) {
        _rightTop[i] = @(NO);
    }
    
    _cols = [NSMutableArray array];
    for (int i = 0; i < n; i ++) {
        _cols[i] = @(-1);
    }
    
    [self place1:0];
    NSLog(@"%d个皇后一共有多少种%d摆法",n,_ways);
}

/**
 * 从第 row 行开始摆皇后
 */
- (void)place1:(int)row {
    int n = (int)_colb.count;
    if (row == n) {
        _ways ++;
        return;
    }
    for (int col = 0; col < n; col ++) {
        
        if ([_colb[col] boolValue]) continue;
        
        int left = row - col + n -1;
        if ([_leftTop[left] boolValue]) continue;
        
        int right = row + col;
        if ([_rightTop[right] boolValue]) continue;

        _colb[col] = @(YES);
        _leftTop[left] = @(YES);
        _rightTop[right] = @(YES);
        
        _cols[row] = @(col);

        [self place1:row +1];
        
        _colb[col] = @(NO);
        _leftTop[left] = @(NO);
        _rightTop[right] = @(NO);
    }
}

/**
 *用位运算优化 控件
 */
- (void)place8Queen {
    _ways = 0;
    _byte = 0;
    _leftByte = 0;
    _rightByte = 0;
    _cols = [NSMutableArray array];
    for (int i = 0; i < 8; i ++) {
        _cols[i] = @(-1);
    }
    [self place8:0];
    NSLog(@"%d一共有多少种%d摆法",8,_ways);
}

- (void)place8:(int)row {
    int n = 8;
    if (row == n) {
        _ways ++;
        return;
    }
    for (int col = 0; col < n; col ++) {
        
        Byte cv = 1 << col;
        if (_byte & cv) continue;

        UInt16 left = row - col + n -1;
        int lv = 1 << left;
        if (_leftByte & lv) continue;

        UInt16 right = row + col;
        int rv = 1 << right;
        if (_rightByte & rv) continue;

        _byte |= cv;
        _leftByte |= lv;
        _rightByte |= rv;
        
        _cols[row] = @(col);

        [self place8:row +1];
        
        _byte &= ~cv;
        _leftByte &= ~lv;
        _rightByte &= ~rv;
    }
}

@end

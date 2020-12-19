//
//  YHQuestionDFS.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionDFS.h"

NSArray *_letters;
NSMutableArray *_chars;
NSMutableArray *_subLetters;
NSMutableArray *_list;


@implementation YHQuestionDFS

#pragma mark -- DFS 深度优先搜索

/**
 * 17 电话号码的字母组合
 */
+ (NSArray *)letterCombinations:(NSString *)digits {
    if (!digits || digits.length == 0) {
        return @[];
    }
    _chars = [NSMutableArray array];
    _subLetters = [NSMutableArray array];
    _list = [NSMutableArray array];
    
    _letters = @[
    @[@"a",@"b",@"c"],
    @[@"d",@"e",@"f"],
    @[@"g",@"h",@"i"],
    @[@"j",@"k",@"l"],
    @[@"m",@"n",@"o"],
    @[@"p",@"q",@"r",@"s"],
    @[@"t",@"u",@"v"],
    @[@"w",@"x",@"y",@"z"]
    ];
    
    int n = (int)digits.length;
    for (int i = 0; i < n; i ++) {
        [_chars addObject:[digits substringWithRange:NSMakeRange(i, 1)]];
    }
    [self dfs:0];
    return _list;
}

+ (void)dfs:(int)index  {
    if (index == _chars.count) {
        // 存一下
        [_list addObject:[_subLetters componentsJoinedByString:@""]];
        return;
    }
    int lidx = [_chars[index] intValue] - 2;
    for (NSString *s in _letters[lidx]) {
        _subLetters[index] = s;
        [self dfs:index + 1];
    }
}


/**
 * 46 全排列
 */

@end

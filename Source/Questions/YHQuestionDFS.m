//
//  YHQuestionDFS.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionDFS.h"
#import "YHBNote.h"

NSArray *_letters;
NSMutableArray *_chars;
NSMutableArray *_subLetters;
NSMutableArray *_list;
NSMutableArray *_used;


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
 * 46 全排列 不包含重复
 */
+ (NSArray *)permute3:(NSArray *)nums {
    if (!nums || nums.count == 0 ) {
        return @[];
    }
    _chars = [NSMutableArray arrayWithArray:nums];
    _subLetters = [NSMutableArray array];
    _list = [NSMutableArray array];
    _used = [NSMutableArray array];
    for (int i = 0; i < nums.count; i ++) {
        _used[i] = @(NO);
    }
    [self dfs1:0];
    return _list;
}

+ (void)dfs1:(int)index {
    if (index == _chars.count) {
        [_list addObject:_subLetters.mutableCopy];
        return;
    }
    for (int i = 0; i < _chars.count; i ++) {
        
        if ([_used[i] boolValue]) {
            continue;
        }
        _used[i] = @(YES);
        _subLetters[index] = _chars[i];
        [self dfs1:index + 1];
        // 还原现场
        _used[i] = @(NO);
    }
}

+ (NSArray *)permute2:(NSArray *)nums {
    if (!nums || nums.count == 0 ) {
        return @[];
    }
    _chars = [NSMutableArray arrayWithArray:nums];
    _subLetters = [NSMutableArray array];
    _list = [NSMutableArray array];
    [self dfs1:0];
    return _list;
}

+ (void)dfs2:(int)index {
    if (index == _chars.count) {
        [_list addObject:_subLetters.mutableCopy];
        return;
    }
    for (int i = 0; i < _chars.count; i ++) {
        
       
        [_subLetters addObject:_chars[i]];
        [self dfs2:index + 1];
        // 还原现场
        [_subLetters removeLastObject];
    }
}

+ (NSArray *)permute:(NSArray *)arr {
    if (!arr || arr.count == 0 ) {
        return @[];
    }
    NSMutableArray *nums = [NSMutableArray arrayWithArray:arr];
    NSMutableArray *list = [NSMutableArray array];
    [self dfs3:0 nums:nums list:list];
    return list;
}

+ (void)dfs3:(int)index
        nums:(NSMutableArray *)nums
        list:(NSMutableArray *)list {
    if (index == nums.count) {
        [list addObject:nums.mutableCopy];
        return;
    }
    // index 是你的层数
    for (int i = index; i < nums.count; i ++) {
        [self swap:i j:index nums:nums];
        [self dfs3:index + 1 nums:nums list:list];
        [self swap:i j:index nums:nums];
    }
}

+ (void)swap:(int)i j:(int)j nums:(NSMutableArray *)nums {
    id tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
}

/**
 * 46 全排列2 (给定数据含重复) 不包含重复数据
 */

+ (NSArray *)permuteRepeat:(NSArray *)arr {
    if (!arr || arr.count == 0 ) {
        return @[];
    }
    NSMutableArray *nums = [NSMutableArray arrayWithArray:arr];
    NSMutableArray *list = [NSMutableArray array];
    [self dfs4:0 nums:nums list:list];
    return list;
}

+ (void)dfs4:(int)index
        nums:(NSMutableArray *)nums
        list:(NSMutableArray *)list {
    if (index == nums.count) {
        [list addObject:nums.mutableCopy];
        return;
    }
    // index 是你的层数
    for (int i = index; i < nums.count; i ++) {
        // 保证一个数字只在一个位置出现一次
        if ([self isRepeat:index i:i nums:nums]) {
            continue;
        }
        [self swap:i j:index nums:nums];
        [self dfs4:index + 1 nums:nums list:list];
        [self swap:i j:index nums:nums];
    }
}

+ (BOOL)isRepeat:(int)idx
               i:(int)i
            nums:(NSMutableArray *)nums {
    for (int j = idx; j < i; j ++) {
        if ([nums[i] intValue] == [nums[j] intValue]) {
            return YES;
        }
    }
    return NO;
}

/**
 * 22 括号生成
 * 当左括号 和 右括号剩余 数量一样 时只能选 左括号
 * 1 ,左括号选择时机:   左括号剩余数量 > 0
 * 2 . 右括号选择时机: 右括号剩余数量 > 0  &&  右括号剩余数量  != 左括号剩余数量
*/

+ (NSArray *)generateParenthesis:(int)n {
    if (n <= 0) {
        return @[];
    }
    NSMutableArray *nums = [NSMutableArray array];
    for (int i = 0; i < (n << 1); i ++) {
        [nums addObject:@""];
    }
    NSMutableArray *list = [NSMutableArray array];
    [self dfsg:0 nums:nums list:list leftRemian:n rightRemian:n];
    return list.copy;
}

+ (void)dfsg:(int)index
        nums:(NSMutableArray *)nums
        list:(NSMutableArray *)list
  leftRemian:(int)leftRemian
  rightRemian:(int)rightRemian {
    if (index == nums.count) {
        [list addObject:[nums componentsJoinedByString:@""]];
        return;
    }
    
    if (leftRemian > 0) {
        nums[index] = @"(";
        [self dfsg:index + 1 nums:nums list:list leftRemian:leftRemian -1 rightRemian:rightRemian];
    }
    
    if (rightRemian > 0 && rightRemian != leftRemian) {
        nums[index] = @")";
        [self dfsg:index + 1 nums:nums list:list leftRemian:leftRemian rightRemian:rightRemian - 1];
    }
}

/**
 * 113 路径综合II
 */
+ (NSArray *)pathSum:(YHBNote *)root sum:(int)sum {
    if (!root) {
        return @[];
    }
    NSMutableArray *nums = [NSMutableArray array];
    NSMutableArray *list = [NSMutableArray array];
    [self dfsp:root remain:sum nums:nums list:list];
    return list;
}

+ (void)dfsp:(YHBNote *)root
      remain:(int)remain
        nums:(NSMutableArray *)nums
        list:(NSMutableArray *)list {
    if (!root) {
        return;
    }
    remain -= [root->element intValue];
    [nums addObject:root->element];
    
    // 叶子节点
    if (!root->left && !root->right) {
        // 找到了
        if (remain == 0) {
            [list addObject:nums.mutableCopy];
        }
    } else {
        [self dfsp:root->left remain:remain nums:nums list:list];
        [self dfsp:root->right remain:remain nums:nums list:list];
    }
    [nums removeLastObject];
}

/**
 * 39 组合总和
 * 数字可以无限制重复
 */
+ (NSArray *)combinationSum:(NSArray *)candidates target:(int)target {
    if (candidates.count == 0 || !candidates || target < 0) {
        return @[];
    }
    return nil;
}

@end

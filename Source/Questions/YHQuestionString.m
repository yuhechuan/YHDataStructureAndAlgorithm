//
//  YHQuestionString.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionString.h"
#import "YHBNote.h"

@implementation YHQuestionString

#pragma mark -- 字符串

/**
 * 01.09.字符串轮转
 *  https://leetcode-cn.com/problems/string-rotation-lcci/
 *  旋转词
 *  back
 *  ackb
 *  kbac
 */
+ (BOOL)isFlipedString:(NSString *)s1 s2:(NSString *)s2 {
    if (!s1 || !s2) {
        return NO;
    }
    
    if (s1.length != s2.length) {
        return NO;
    }
    NSString *newString = [NSString stringWithFormat:@"%@%@",s1,s1];
    return [newString containsString:s2];
}

/**
 * 572 另一个树的子树
 */
+ (BOOL)isSubtree:(YHBNote *)s t:(YHBNote *)t {
    // 序列化
    NSString *sstr = [self postorder:s];
    NSString *tstr = [self postorder:t];
    NSLog(@"1.====%@",sstr);
    NSLog(@"2.====%@",tstr);
    return [sstr containsString:tstr];
}

/**
 * 利用后续遍历的方式进行序列化
 */
+ (NSString *)postorder:(YHBNote *)note {
    if (!note) {
        return @"";
    }
    NSMutableString *sb = [NSMutableString string];
    [self postorder:note sb:sb];
    return sb;
}

+ (void)postorder:(YHBNote *)note sb:(NSMutableString *)sb {
    if (note->left) {
        [self postorder:note->left sb:sb];
    } else {
        [sb appendString:@"#!"];
    }
    if (note->right) {
        [self postorder:note->right sb:sb];
    } else {
        [sb appendString:@"#!"];
    }
    
    [sb appendString:note->element];
    [sb appendString:@"!"];
}

/**
 * 242. 有效的字母异位词
 */
+ (BOOL)isAnagram:(NSString *)s t:(NSString *)t {
    if (!s || !t) {
        return NO;
    }
    if (s.length != t.length) {
        return NO;
    }
    int lenth = (int)s.length;
    NSMutableArray *chars = [NSMutableArray arrayWithCapacity:26];
    for (int i = 0; i < 26; i ++) {
        [chars addObject:@(0)];
    }
    for (int i = 0; i < lenth; i ++) {
        int index = [s characterAtIndex:i] - 'a';
        chars[index] = @([chars[index] intValue] + 1);
    }
    
    for (int i = 0; i < lenth; i ++) {
        int index = [t characterAtIndex:i] - 'a';
        int v =  [chars[index] intValue] - 1;
        if (v < 0) {
            return NO;
        }
        chars[index] = @(v);
    }
    return YES;
}

/**
 * 151.翻转字符串里面的单词
 *  去除多余空格
 *  hello world!
 *  world! hello
 */
+ (NSString *)reverseWords:(NSString *)s {
    if (!s) {
        return nil;
    }
    // 去除多余空格
    int length = (int)s.length;
    char chars[length];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],length);
    
    int cur = 0;      // 当前用来存放字符的位置
    BOOL space = YES; // -1 是空格 处理前面空格
    for (int i = 0; i < length; i ++) {
        // 非空格字符
        if (chars[i] != ' ') {
            chars[cur ++] = chars[i];
            space = NO;
        } else if (space == NO) {
            chars[cur ++] = ' ';
            space = YES;
        }
    }
    
    int len = space ? cur - 1 : cur;
    // 全部逆序
    [self reversedOrder:chars li:0 ri:len];

    // 分别逆序
    int preIndex = -1; // 假想的哨兵
    for (int i = 0; i < len; i++) {
        if (chars[i] == ' ') {
            [self reversedOrder:chars li:preIndex + 1 ri:i];
            preIndex = i;
        }
    }
    [self reversedOrder:chars li:preIndex + 1 ri:len];
    
    // 组装字符串
    NSMutableString *mustr = [NSMutableString string];
    for (int i = 0; i < len; i++) {
        [mustr appendFormat:@"%c",chars[i] ];
    }
    return mustr;
}

+ (void)reversedOrder:(char [])chars
                li:(int)li
                ri:(int)ri {
    ri--;
    while (li < ri) {
        char tmp = chars[li];
        chars[li] = chars[ri];
        chars[ri] = tmp;
        li ++;
        ri --;
    }
}

/**
 * 3. 无重复字符的最长子串
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 * pwwkew
 * 单字节字符
 */
+ (int)lengthOfLongestSubstring:(NSString *)s {
    if (!s || s.length ==0) {
        return 0;
    }
    int length = (int)s.length;
    char chars[length];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],length);
    
    // 0位置特殊处理
    int size = 128;
    int *map = (int *)malloc(size * sizeof(int));
    
    for (int i = 0; i < size; i ++) {
        map[i] = -1;
    }
    
    // 用于保存字符上次出现的位置
    map[chars[0]] = 0;
    
    // 以i减一 结尾的 最长子串 开始位置
    int li = 0;
    int max = 1;
    for (int i = 1; i < length; i++) {
        // 上一次出现的位置
        // 如果k字符不存在 啧 pi为最小-1
        int index = chars[i] ;
        int pi = map[index];
        if (li <= pi) {
            li = pi + 1;
        }
        map[index] = i;
        max = MAX(max, i - li + 1);
    }
    free(map);
    return max;
}


@end

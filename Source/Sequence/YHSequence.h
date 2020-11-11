//
//  YHSequence.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/10.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 串
 * 前缀 真前缀(去除本身)  后缀  真后缀(去除本身)
 * 串的匹配算法
 * 文本串tlen  模式串plen
 * 算法都有哪些
 */
@interface YHSequence : NSObject

// 给定文本串 和 模式串 查找模式串在文本串中的位置
/**
 * 蛮力算法: 以字符为单位 从左到右移动模式串,直到匹配成功
 */
- (int)indexOf:(NSString *)text
       pattern:(NSString *)pattern;


@end

NS_ASSUME_NONNULL_END

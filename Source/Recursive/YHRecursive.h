//
//  YHRecursive.h
//  YHDataStructureAndAlgorithm
//
//  Created by yuhechuan on 2020/10/16.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 * 递归
 */
@interface YHRecursive : NSObject

- (int)fib0:(int)n;
- (int)fib1:(int)n;
- (int)fib2:(int)n;
- (int)fib3:(int)n;
- (int)fib4:(int)n;
- (int)fib5:(int)n;

/**
 * 汉诺塔
 * 将n 个盘子从p1 到 p3  一次只移动一个
 */
- (void)hanoi:(int)n
           p1:(NSString *)p1
           p2:(NSString *)p2
           p3:(NSString *)p3;

@end

NS_ASSUME_NONNULL_END

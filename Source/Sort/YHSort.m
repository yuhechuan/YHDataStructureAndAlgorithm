//
//  YHSort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/13.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHSort.h"

@class YHShellSort;

@interface YHStudent : NSObject<NSCopying>

@property (nonatomic, assign) int age;
@property (nonatomic, assign) int score;

@end

@implementation YHStudent

- (id)copyWithZone:(NSZone *)zone {
    YHStudent *s = [[YHStudent alloc]init];
    s.age = self.age;
    s.score = self.score;
    return s;
}

@end


/**
 * 原地算法
 * 不依赖 额外的资源 或者依赖少数的额外资源 仅靠输入覆盖输出
 * 空间复杂度为O(1) 的算法称为原地算法
 */

@interface YHSort ()

@property (nonatomic, strong) YHComparator *comparator;

@end

@implementation YHSort

- (instancetype)initWithComparator:(YHComparator *)comparator {
    if (self = [super init]) {
        _comparator = comparator;
    }
    return self;
}

- (void)sort:(NSMutableArray *)sortArray {
    if (!sortArray || sortArray.count < 2) {
        return;
    }
    _swapCount = 0;
    _cmpCount = 0;
    self.time = 0;
    self.sortArray = sortArray;
    NSDate *startTime = [NSDate date];
    [self realizeSort];
    self.time = -[startTime timeIntervalSinceNow];
}

- (void)realizeSort {
    // 子类实现
}

- (int)cmp:(int)p1 p2:(int)p2 {
    NSObject *pv1 = self.sortArray[p1];
    NSObject *pv2 = self.sortArray[p2];
    return [self cmpv:pv1 v2:pv2];
}

- (int)cmpv:(NSObject *)v1 v2:(NSObject *)v2 {
    _cmpCount ++;
    if (self.comparator.icompare) {
        return self.comparator.icompare(v1,v2);
    }
    return 0;
}

- (void)swap:(int)p1 p2:(int)p2 {
    if (p1 == p2) {
        return;
    }
    _swapCount ++;
    NSObject *tmp = self.sortArray[p1];
    self.sortArray[p1] = self.sortArray[p2];
    self.sortArray[p2] = tmp;
}
/**
 * 用20个相同对象 进行测试
 */
- (BOOL)isStable {
    // 希尔排序 不能用这个方法判断
    if ([self isKindOfClass:NSClassFromString(@"YHShellSort")]) {
        return NO;
    }
    
    YHComparator *c = [[YHComparator alloc]init];
    c.icompare = ^int(YHStudent * _Nonnull a, YHStudent * _Nonnull b) {
        return a.age - b.age;
    };
    YHSort *sort = [[[self class] alloc] initWithComparator:c];
    NSMutableArray *students = [NSMutableArray array];
    for (int i = 0; i < 20; i ++) {
        YHStudent *s = [[YHStudent alloc]init];
        s.age = 10;
        s.score = i * 10;
        [students addObject:s];
    }
    [sort sort:students];
    BOOL isret = YES;
    for (int i = 0; i < 19; i ++) {
        YHStudent *s1 = students[i];
        YHStudent *s2 = students[i + 1];
        if (s2.score - s1.score != 10) {
            isret = NO;
            break;
        }
    }
    return isret;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@: 交换次数:%d 比较次数:%d 所花时间:%f 稳定性: %d",NSStringFromClass([self class]),_swapCount,_cmpCount,self.time,[self isStable]];
}

@end


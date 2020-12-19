//
//  YHQuestionArraySort.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionArraySort.h"

@implementation YHQuestionArraySort

#pragma mark --  数组 排序
/**
 * 88合并2个有序数组
 */
+ (NSArray *)merge:(NSArray *)num1 num2:(NSArray *)num2 {
    NSMutableArray *sortArr = [NSMutableArray array];
    [sortArr addObjectsFromArray:num1];
    [sortArr addObjectsFromArray:num2];

    int maxl = (int)num1.count + (int)num2.count;
    int cur = maxl -1;
    int top = (int)num1.count -1;
    int bom = (int)num2.count -1;
    
    while (bom >= 0) {
        if (top >= 0 && [num1[top] intValue] > [num2[bom] intValue]) {
            sortArr[cur--] = num1[top--];
        } else {
            sortArr[cur--] = num2[bom--];
        }
    }
    return sortArr;
}

/**
 *  75 颜色分类
 *  红白蓝 0 1 2
 *  [2,0,1,0,2,1];
 *  [0,0,1,1,2,2];
 *  要求原地排序
 */
+ (void)colorClassify:(NSMutableArray *)num {
    int i = 0;
    int l = 0;
    int r = (int)num.count - 1;
    
    while (i <= r) {
        int v = [num[i] intValue];
        if (v == 0) {
            [self swap:i++ p2:l++ nums:num];
        } else if (v == 1) {
            i ++;
        } else {
            [self swap:i p2:r-- nums:num];
        }
    }
}


+ (void)swap:(int)p1
          p2:(int)p2
        nums:(NSMutableArray *)nums {
    NSObject *tmp = nums[p1];
    nums[p1] = nums[p2];
    nums[p2] = tmp;
}

/**
 * 16 部分排序
 *  [1, 5, 4, 3,2,6,7]
 *  [1,4]
 *  返回 一段无序的序列 排序完成之后 导致 整个有序
 *  返回开始下标和结束下标
 *  逆序对
 *  右边 最后一个逆序对
 *  左边
 */
+ (NSArray *)subSort:(NSArray *)nums {
    if (nums.count == 0 || nums.count > 10000) {
        return @[@(-1),@(-1)];
    }
    // 从左往右 找到一个逆序对
    int indexr = -1;
    int maxv = [nums[0] intValue];
    int length = (int)nums.count;
    for (int i = 1; i < length; i ++) {
        int v = [nums[i] intValue];
        if (v >= maxv) {
            maxv = v;
        } else {
            indexr = i;
        }
    }
    
    if (indexr == -1) {
        return @[@(-1),@(-1)];
    }
    
    int indexl = -1;
    int minv = [nums[length -1] intValue];
    for (int i = length - 2; i >= 0; i --) {
        int v = [nums[i] intValue];
        if (v <= minv) {
            minv = v;
        } else {
            indexl = i;
        }
    }
    return @[@(indexl),@(indexr)];
}
/**
 *  977 有序数组的平方
 */
+ (NSArray *)sortedSquares:(NSArray *)nums {
    
    int l = 0;
    int r = (int)nums.count -1;
    int i = r;
    NSMutableArray *sortArr = [NSMutableArray arrayWithArray:nums];
    while (l <= r) {
        int lv = [nums[l] intValue];
        int rv = [nums[r] intValue];
        int sqlv = lv *lv;
        int sqrv = rv *rv;
        if (lv + rv < 0) {
            sortArr[i--] = @(sqlv);
            l ++;
        } else {
            sortArr[i--] = @(sqrv);
            r --;
        }
    }
    return sortArr;
}

+ (NSArray *)sortedSquares1:(NSArray *)nums {
    
    int l = 0;
    int r = (int)nums.count -1;
    int i = r;
    NSMutableArray *sortArr = [NSMutableArray arrayWithArray:nums];
    while (l <= r) {
        int lv = [nums[l] intValue];
        int rv = [nums[r] intValue];
        int sqlv = lv *lv;
        int sqrv = rv *rv;
        if (lv > 0) {
            sortArr[i--] = @(sqrv);
            r --;
            continue;
        }
        
        if (sqlv > sqrv) {
            sortArr[i--] = @(sqlv);
            l ++;
        } else {
            sortArr[i--] = @(sqrv);
            r --;
        }
    }
    return sortArr;
}

@end

//
//  YHQuestionDynamicProgramming.m
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import "YHQuestionDynamicProgramming.h"

@implementation YHQuestionDynamicProgramming

#pragma mark -- 动态规划
/**
 * 剑指 Offer 47. 礼物的最大价值
 */
// 二维数组 可以优化成一位数组
+ (int)maxValue1:(NSArray *)grid  {
    int m = (int)grid.count;
    int n = (int)[grid[0] count];
    int dp[m][n];
    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
            int v = [grid[i][j] intValue];
            if (i == 0 && j == 0) {
                dp[i][j] = v;
            } else if (i == 0) {
                dp[i][j] = dp[i][j-1] + v;
            } else if (j == 0) {
                dp[i][j] = dp[i-1][j] + v;
            } else {
                dp[i][j] = MAX(dp[i -1][j], dp[i][j -1]) + v;
            }
        }
    }
    return dp[m -1][n-1];
}

/**
 * 优化成一维 数组
 */
+ (int)maxValue:(NSArray *)grid  {
    int m = (int)grid.count;
    int n = (int)[grid[0] count];
    int dp[m];
    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
            int v = [grid[i][j] intValue];
            if (i == 0 && j == 0) {
                dp[j] = v;
            } else if (i == 0) {
                dp[j] = dp[j -1] + v;
            } else if (j == 0) {
                dp[j] = dp[j] + v;
            } else {
                dp[j] = MAX(dp[j-1], dp[j]) + v;
            }
        }
    }
    return dp[m -1];
}

/**
 * 121 买卖股票的最佳时间
 */
+ (int)maxProfit:(NSArray *)prices {
    int min = [prices[0] intValue];
    int maxv = 0;
    int length = (int)prices.count;
    for (int i = 1; i < length; i ++) {
        int v = [prices[i] intValue];
        min = MIN(min, v);
        maxv = MAX(maxv, v -min);
    }
    if (maxv < 0) {
        maxv = 0;
    }
    return maxv;
}

// 动态规划 想法
+ (int)maxProfit1:(NSArray *)prices {
    return 0;
}
/**
 * 72.编辑距离 从word1 转成word2
 * 删除一个字符 、插入一个字符、替换一个字符
 * horse ---> ros
 * h --> r  替换    r  删除  e  删除 共三步
 * mice --->  arise
 * dp[i][j] 表示 0-i  0-j 变换所需的最小步数
 */
// 一维数组
+ (int)minDistance:(NSString *)word1
             word2:(NSString *)word2 {
    int m = (int)word1.length + 1;
    int n = (int)word2.length + 1;
    int dp[n];
    for (int i = 0; i < m; i ++) {
        int cur = 0;
        for (int j = 0; j < n; j ++) {
            int lt = cur;
            cur = dp[j];
            if (i == 0 && j == 0) {
                dp[j] = 0;
            } else if (i == 0) {
                dp[j] = j;
            } else if (j == 0) {
                dp[j] = i;
            } else {
                int v1 = dp[j] + 1;
                int v2 = dp[j-1] + 1;
                char c1 = [word1 characterAtIndex:i - 1];
                char c2 = [word2 characterAtIndex:j - 1];
                int v3 = c1 == c2 ?  lt :lt + 1;
                dp[j] = MIN(v3, MIN(v1, v2));
            }
        }
    }
    return dp[n -1];
}
// 二维数组
+ (int)minDistance1:(NSString *)word1
             word2:(NSString *)word2 {
    /*
     先删除一个字符 再插入
     1.dp[i][j] = dp[i-1][j] + 1;
     2.dp[i][j] = dp[i][j-1] + 1;
     3.最后一个字符相等
     dp[i][j] = dp[i-1][j-1];
     4.最后一个字符不等
     dp[i][j] = dp[i-1][j-1] + 1;

     */
    int m = (int)word1.length + 1;
    int n = (int)word2.length + 1;
    int dp[m][n];
    for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
            if (i == 0 && j == 0) {
                dp[i][j] = 0;
            } else if (i == 0) {
                dp[i][j] = j;
            } else if (j == 0) {
                dp[i][j] = i;
            } else {
                int v1 = dp[i-1][j] + 1;
                int v2 = dp[i][j-1] + 1;
                char c1 = [word1 characterAtIndex:i - 1];
                char c2 = [word2 characterAtIndex:j - 1];
                int v3 = c1 == c2 ?  dp[i-1][j-1] :dp[i-1][j-1] + 1;
                dp[i][j] = MIN(v3, MIN(v1, v2));
            }
        }
    }
    return dp[m - 1][n -1];
}

/**
 * 5,最长回文子串
 * 暴力法  n^3
 * 时间复杂度 n^2
 * 空间复杂度 0(n^2)
 */
+ (NSString *)longestPalindrome1:(NSString *)s {
    /**
     dp[i][j] 表示  [i,j]子串是否是回文串
     */
    int n = (int)s.length;
    if (!s || n == 0 || n == 1) {
        return s;
    }
    
    int dp[n][n];
    int maxLength = 1;
    int maxIndex = 0;
    
    char chars[n];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],n);
    
    for (int i = n; i >= 0; i --) {
        for (int j = i; j < n; j ++) {
            int length = j - i + 1;
            int ret = chars[i] == chars[j] && (length <= 2 || dp[i + 1][j -1]);
            if (ret && length > maxLength) {
                maxLength = length;
                maxIndex = i;
            }
            dp[i][j] = ret;
        }
    }
    NSString *sub = [s substringWithRange:NSMakeRange(maxIndex, maxLength)];
    return sub;
}
/**
 * 中心扩散法
 * 扩展中心的数量 n + (n -1) = 2n -1;
 *  时间复杂度 n^2
 *  空间复杂度 0(1)
 */
+ (NSString *)longestPalindrome2:(NSString *)s {
    int n = (int)s.length;
    if (!s || n <= 1) {
        return s;
    }
    
    // asava
    int maxLength = 1;
    int maxIndex = 0;
    for (int i = n -2; n > 0; i --) {
        // 如果回文串的长度的一半 大于 当前索引 可以退出
        if (maxLength / 2 > i) {
            break;
        }
        
        int len1 = [self palindromeSubstring:s l:i -1 r:i+1];
        int len2 = [self palindromeSubstring:s l:i r:i+1];
        len1 = MAX(len1, len2);
        if (len1 > maxLength) {
            maxLength = len1;
            maxIndex = i - ((len1 - 1) >>1);
        }
    }
    // 特殊处理 一下
    char c1 = [s characterAtIndex:0];
    char c2 = [s characterAtIndex:1];
    if (c1 == c2 && maxLength < 2) {
        maxLength = 2;
        maxIndex = 0;
    }
    NSString *sub = [s substringWithRange:NSMakeRange(maxIndex, maxLength)];
    return sub;
}
/**
 * 扩展中心 优化 n -->n^2
 */
+ (NSString *)longestPalindrome3:(NSString *)s {
    int n = (int)s.length;
    if (!s || n <= 1) {
        return s;
    }
    int maxLength = 1;
    int maxIndex = 0;
    
    char chars[n];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],n);
    int i = 0;
    while (i < n) {
        int r = i;
        while (++r < n && chars[i] == chars[r]) {};
        int l = i -1;
        i = r;
        while (l >= 0 && r < n && chars[l] == chars[r]) {
            l--;
            r++;
        }
        int len = r - ++l;
        if (len > maxLength) {
            maxLength = len;
            maxIndex = l;
        }
    }
    NSString *sub = [s substringWithRange:NSMakeRange(maxIndex, maxLength)];
    return sub;
}

/**
 * 马拉车算法Manacher
 */
+ (NSString *)longestPalindrome:(NSString *)s {
    int n = (int)s.length;
    if (!s || n <= 1) {
        return s;
    }
    int maxLength = 1;
    int maxIndex = 0;
    
    // 预处理字符串
    int m = (n << 1) + 3;
    char mchars[m];
    mchars[0] = '^';
    mchars[1] = '#';
    mchars[m -1] = '$';
    
    for (int i = 0; i < n; i ++) {
        int idx = (i + 1) << 1;
        mchars[idx] = [s characterAtIndex:i];
        mchars[idx + 1] = '#';
    }
    
    // 0,1 特殊字符 2好位置是1 两边都是#
    int mArr[m];
    for (int i = 0; i < m; i ++) {
        mArr[i] = 0;
    }
    
    int r = 1;
    int c = 1;
    for (int i = 2; i < m -2; i ++) {
        if (r > i) {
            int li = (c <<1) -i;
            mArr[i] = i + mArr[li] <= r ? mArr[li] :r - i;
        }
        
        // 以i 为中心 左右扩展
        while (mchars[i + mArr[i] + 1] == mchars[i - mArr[i] - 1]) {
            mArr[i] =  mArr[i] + 1;
        }
        
        // 更新c 跟r
        if (i + mArr[i] > r) {
            c = i;
            r = i + mArr[i];
        }
        if (mArr[i] > maxLength) {
            maxLength = mArr[i];
            maxIndex = i;
        }
    }
    int begin = (maxIndex - maxLength) >> 1;
    NSString *sub = [s substringWithRange:NSMakeRange(begin, maxLength)];
    return sub;
}



// 是否是回文串
+ (int)palindromeSubstring:(NSString *)s
                           l:(int)l
                           r:(int)r {
    int n = (int)s.length;
    char chars[n];
    memcpy(chars, [s cStringUsingEncoding:NSUTF8StringEncoding],n);
    while (l >= 0 && r < n && chars[l] == chars[r]) {
        l--;
        r++;
    }
    return r -l -1;
};


@end

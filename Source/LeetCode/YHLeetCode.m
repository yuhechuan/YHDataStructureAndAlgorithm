//
//  YHLeetCode.m
//  算法
//
//  Created by ruaho on 2019/6/17.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHLeetCode.h"

@implementation YHLeetCode

// 1 2 3 5 6 7
/*
 15.三数相加
 */
+ (BOOL)isThreeAdd:(NSArray *)arr
               num:(NSInteger)num {
    // 排序
    NSArray *d = [arr sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSInteger len = d.count;
    
    for (int i = 0; i < len - 2; i ++) {
        if (i > 0 && [d[i] integerValue] == [d[i - 1] integerValue]) {
            continue;
        }
        NSInteger left = i +1;
        NSInteger right = len - 1;
        while (left <= right) {
            NSInteger a = [d[left] integerValue];
            NSInteger b = [d[i] integerValue];
            NSInteger c = [d[right] integerValue];
            
            NSInteger sum = a + b +c;
            
            if (num == sum) {
                NSLog(@"%ld-%ld-%ld",(long)a,(long)b,(long)c);
                return YES;
            }
            
            if (sum > num) {
                while (right > 0 && ([d[right] integerValue] == [d[--right] integerValue]));
            }
            
            if (sum < num) {
                while (left <len-1 && ([d[left] integerValue] == [d[++left] integerValue]));
            }
        }
    }
    return NO;
}

/*
 1.两数相加
 */
+ (NSArray *)isTwoAdd:(NSArray *)arr
                  num:(NSInteger)num {
    NSInteger len = arr.count;
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    for (NSInteger i = 0; i < len; i ++) {
        if (d[arr[i]]) {
            NSInteger a = i;
            NSInteger b = [d[arr[i]] integerValue];
            return @[@(a),@(b)];
        } else {
            d[@(num - [arr[i] integerValue])] = @(i);
        }
    }
    return nil;
}

/*
 2.两数相加
 2 -> 4 -> 3
 5 -> 6 -> 4
 
 7 -> 0 -> 8
 */
+ (YHDoubleLinked *)twoAddLink:(YHDoubleLinked *)linkOne
                       linkTwo:(YHDoubleLinked *)linkTwo {
    YHNote *q = linkOne->frist;
    YHNote *p = linkTwo->frist;
    YHDoubleLinked *d = [[YHDoubleLinked alloc]init];
    NSInteger carry = 0;
    while (q != nil || p!= nil) {
        
        NSInteger qe = q ? [q->element integerValue] : 0 ;
        NSInteger pe = p ? [p->element integerValue] : 0 ;
        NSInteger v = pe + qe;
        NSInteger r = v /10 >0?v %10:v;
        [d add:@(r + carry)];
        carry = v /10 > 0 ? 1:0;
        if (q) {
            q = q->next;
        }
        if (p) {
            p = p->next;
        }
    }
    
    if (carry > 0) {
        [d add:@(carry)];
    }
    
    NSLog(@"%@",d);
    return d;
}
/*
3.无重复字符的最长子串
*/
+ (NSInteger)lengthOfLongestSubstring:(NSString *)string {
    NSMutableArray *set = [NSMutableArray array];
    NSInteger count = string.length;
    NSInteger maxLength = 0;
    NSInteger slidePointer = -1;
    for (int i = 0; i < count; i++) {
        char c = [string characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c",c];
        
        if ([set containsObject:key]) {
            maxLength  = MAX((set.count - slidePointer - 1), maxLength);
            slidePointer = [set indexOfObject:key];
        }
        [set addObject:key];
    }
    return maxLength;
}

/*
 4.寻找两个有序数组的中位数
 */

+ (NSInteger)findMedianSortedArrays:(NSArray *)num1
                               num2:(NSArray *)num2 {
    NSInteger n = num1.count;
    NSInteger m = num2.count;
    
    if (n > m) {
        return [self findMedianSortedArrays:num2 num2:num1];// 保证n小
    }
    
    NSInteger lo = 0;
    NSInteger hi = 2 *n; // 二分查找所用
    
    NSInteger lmax1 = 0;
    NSInteger rmin1 = 0;
    NSInteger lmax2 = 0;
    NSInteger rmin2 = 0;

    NSInteger c1 = 0;
    NSInteger c2 = 0;
    
    // 2 3 5
    // 7 8 9 11
    while (lo <= hi) {
        c1 = (lo + hi) /2;
        c2 = m + n - c1;
        
        lmax1 = (c1 == 0 )? INT_MIN : [num1[(c1-1) /2] integerValue];
        rmin1 = (c1 == 2 *n)?INT_MAX:[num1[c1/2] integerValue];
        
        lmax2 = (c2 == 0) ? INT_MIN : [num2[(c2 -1) /2] integerValue];
        rmin2 = (c2 == 2 *m)?INT_MAX:[num2[c2/2] integerValue];
        
        if (lmax1 > rmin2) {
            hi = c1 - 1;
        } else if (rmin1 < lmax2) {
            lo = c1 + 1;
        } else {
            break;
        }
    }
    
    NSInteger midle = (MAX(lmax1,lmax2) + MIN(rmin1, rmin2)) /2;
    return midle;
}


/*
 5.最长回文子串
 */

// 中心扩散法
+ (NSString *)longestPalindrome:(NSString *)s {
    NSInteger length = s.length;
    NSInteger maxLength = 1;
    NSString *maxString = nil;
    for (int i = 0; i < length; i ++) {
        NSString *center = [self centerSpread:s
                                         left:i
                                        right:i];
        
        NSString *sides = [self centerSpread:s
                                         left:i
                                        right:i+1];
        NSString *longest = center.length > sides.length ?center:sides;
        NSInteger bothMax = MAX(center.length, sides.length);

        if (bothMax > maxLength) {
            maxString = longest;
            maxLength = bothMax;
        }
    }
    return maxString;
}

+ (NSString *)centerSpread:(NSString *)s
                      left:(NSInteger)left
                     right:(NSInteger)right {
    NSInteger length = s.length;
    NSInteger l = left;
    NSInteger r = right;
    
    while (l >= 0 && r < length && ([s characterAtIndex:l] == [s characterAtIndex:r])) {
        l--;
        r++;
    }
    NSString *sub = [s substringWithRange:NSMakeRange(l + 1, r -l -1)];
    return sub;
}

// 马拉车算法
+ (NSString *)longestPalindrome1:(NSString *)s {
    NSInteger length = s.length;
    NSMutableArray *arr = [NSMutableArray array];
    NSMutableArray *p = [NSMutableArray array];
    [arr addObject:@"#"];
    [p addObject:@(0)];
    for (int i = 0; i < length; i++) {
        char c = [s characterAtIndex:i];
        [arr addObject:[NSString stringWithFormat:@"%c",c]];
        [arr addObject:@"#"];
        [p addObject:@(0)];
    }
    
    NSInteger len = arr.count;  // 完成转化的数组 奇数
    NSInteger maxLen = 0;      // 最长回文长度
    
    NSInteger ID = 0; // 此时回文中心
    NSInteger mx = 0; // 此时回文最右边界
    
    NSString *longtestStr = nil;
    for (int i = 0; i < len; i ++) {
        if (i < mx) {
            p[i] = @(MIN([p[2 * ID - i] integerValue], mx - i));
        } else {
            if (i > mx) {
                @throw [NSException exceptionWithName:@"out of bounds" reason:@"element must not be null" userInfo:nil];
            }
            p[i] = @(1);
        }
        
        while ((i -[p[i] integerValue] >= 0)&& (i + [p[i] integerValue] < len) &&[arr[i -[p[i] integerValue]] isEqualToString: arr[i +[p[i] integerValue]]]) {
            p[i] = @([p[i] integerValue] + 1);
        }
        
        NSInteger far = i + [p[i] integerValue];
        if (mx < far) {
            mx = far;
            ID = i;
        }
        
        NSInteger l = [p[i] integerValue] -1;
        if (l > maxLen) {
            maxLen = l;
        }
    }
    ID = ID / 2 - 1;
    mx = mx / 2 - 1;
    longtestStr = [s substringWithRange:NSMakeRange((2 *ID - mx), maxLen)];
    return longtestStr;
}
/*
  Z 6.字形变换
 */
+ (NSString *)convert:(NSString *)s
            rowNumber:(NSInteger)rowNumber {
    
    NSMutableArray *arr = [NSMutableArray  array];
    NSInteger len = s.length;
    NSInteger floor = 0;
    NSInteger rowGrow = - 1;

    for (int i = 0; i < len; i ++) {
        if (arr.count < floor + 1) {
            NSMutableArray *a = [NSMutableArray  array];
            [arr addObject:a];
        }
        
        NSMutableArray *f = arr[floor];
        NSString *current = [NSString stringWithFormat:@"%c",[s characterAtIndex:i]];
        [f addObject:current];
        
        if (floor == 0 || (floor == rowNumber -1)) {
            rowGrow = -rowGrow;
        }
        
        floor = floor + rowGrow;
    }
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    for (int i = 0; i < rowNumber; i ++) {
        [result appendString:[arr[i] componentsJoinedByString:@""]];
    }
    return result;
}
/*
 *7.整数反转
 */
+ (NSInteger)reverse:(NSInteger)x {
    NSInteger ans = 0;
    NSInteger p = x;
    while (p != 0) {
        NSInteger pop = p %10;
        if (ans > INT_MAX/10 || (ans == INT_MAX /10 && pop > 7)) {
            return 0;
        }
        
        if (ans < INT_MIN/10 || (ans == INT_MIN /10 && pop < -8)) {
            return 0;
        }
        ans = ans *10 + pop;
        p /= 10;
    }
    return ans;
}
/*
 *8.字符串转换整数 (atoi)
 */

+ (NSInteger)myAtoi:(NSString *)str {
    
    //去掉投不空格
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSInteger len = str.length;
    NSString *frist = [NSString stringWithFormat:@"%c",[str characterAtIndex:0]];
    NSString *valid = @"0123456789+-";
    NSString *validNum = @"0123456789";
    if (![valid containsString:frist]) {
        return 0;
    }
    BOOL isfushu = NO;
    NSMutableString *string = [NSMutableString stringWithString:@""];
    for (int i = 0; i < len; i ++) {
        NSString *s = [NSString stringWithFormat:@"%c",[str characterAtIndex:i]];
        if (i == 0 &&[s isEqualToString:@"-"]) {
            isfushu = YES;
            continue;
        }
        
        if ([validNum containsString:s]) {
            [string appendString:s];
        } else {
            break;
        }
    }
    
    NSInteger r = 0;
    if (string.length >0) {
        r = [string integerValue];
    }
    
    NSInteger pop = r % 10;
    NSInteger ans = r / 10;
    
    if (ans > INT_MAX/10 || (ans == INT_MAX /10 && pop > 7)) {
        return 0;
    }
    
    if (-ans < INT_MIN/10 || (-ans == INT_MIN /10 && -pop < -8)) {
        return 0;
    }
    
    return isfushu ? -r:r;
}

/*
 9.回文数
 */

+ (BOOL)isPalindrome:(NSInteger)x {
    if (x <= 10) {
        return NO;
    }
    NSInteger f = [self reverse:x];
    return f == x;
}

/*
 11.盛最多水的容器 双指针
 */
+ (NSInteger)maxArea:(NSArray *)heights {
    NSInteger low = 0;
    NSInteger high = heights.count - 1;
    NSInteger v = 0;
    while (low < high) {
        v = MAX(v, MIN([heights[low] integerValue], [heights[high] integerValue]) * (high - low));
        
        if ([heights[low] integerValue] < [heights[high] integerValue]) {
            low ++;
        } else {
            high --;
        }
    }
    return v;
}

/*
 * 12.整数转罗马数字
 {1000,900,500,400,100,90,50,40,10,9,5,4,1};
 {"M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"};
1994 MCMXCIV*/

+ (NSString *)intToRoman:(NSInteger)num {
    NSArray *rm = @[@"M",@"CM",@"D",@"CD",@"C",@"XC",@"L",@"XL",@"X",@"IX",@"V",@"IV",@"I"];
    NSArray *al = @[@1000,@900,@500,@400,@100,@90,@50,@40,@10,@9,@5,@4,@1];
    NSMutableString *string = [NSMutableString string];
    for (int i = 0; i < 13; i ++) {
        while (num >= [al[i] integerValue]) {
            [string appendString:rm[i]];
            num -= [al[i] integerValue];
        }
    }
    return string;
}
/*
 * 13.罗马数字转整数
 MCMXCIV
 */
+ (NSInteger)romanToInt1:(NSString *)str {
    NSArray *rm = @[@"M",@"CM",@"D",@"CD",@"C",@"XC",@"L",@"XL",@"X",@"IX",@"V",@"IV",@"I"];
    NSArray *al = @[@1000,@900,@500,@400,@100,@90,@50,@40,@10,@9,@5,@4,@1];
    NSInteger len = str.length;
    
    NSString *pre = @"CXI";
    NSArray *valid = @[@"CM",@"CD",@"XC",@"XL",@"IX",@"IV"];
    
    NSInteger alb = 0;

    for (int i = 0; i < len; i ++) {
        NSInteger ans = 0;
        NSString *s = [NSString stringWithFormat:@"%c",[str characterAtIndex:i]];
        NSString *result = s;
        if (i < len - 1) {
            NSString *ns = [NSString stringWithFormat:@"%c",[str characterAtIndex:i + 1]];
            result = [NSString stringWithFormat:@"%@%@",s,ns];
        }
        if ([pre containsString:s] && [valid containsObject:result]) {
            ans = [al[[rm indexOfObject:result]] integerValue];
            i ++; // 跳过一位
        } else {
            ans = [al[[rm indexOfObject:s]] integerValue];
        }
        alb += ans;
    }
    
    return alb;
}

+ (NSInteger)romanToInt:(NSString *)str {
    NSInteger len = str.length;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"M"] = @1000;
    dict[@"CM"] = @900;
    dict[@"D"] = @500;
    dict[@"CD"] = @400;
    dict[@"C"] = @100;
    dict[@"XC"] = @90;
    dict[@"L"] = @50;
    dict[@"XL"] = @40;
    dict[@"X"] = @10;
    dict[@"IX"] = @9;
    dict[@"V"] = @5;
    dict[@"IV"] = @4;
    dict[@"I"] = @1;
    NSInteger alb = 0;
    
    for (int i = 0; i < len; i ++) {
        NSInteger ans = 0;
        NSString *ns = nil;
        if (i < len -1) {
            ns = [str substringWithRange:NSMakeRange(i, 2)];
        }
        if (ns && dict[ns]) {
            ans = [dict[ns] integerValue];
            i ++;
        } else {
            NSString *s = [str substringWithRange:NSMakeRange(i, 1)];
            ans = [dict[s] integerValue];
        }
        alb += ans;
    }
    return alb;
}

/*
 *14最长公共前缀
 */
+ (NSString *)longestCommonPrefix1:(NSArray *)strs {
    
    NSInteger count = strs.count;
    NSInteger mx = 0;
    NSMutableString *string = @"".mutableCopy;
    for (int i = 0; i < count -1; i ++) {
        string = @"".mutableCopy;
        NSInteger len = 0;
        NSString *f = strs[i];
        NSString *p = strs[i +1];
        if (mx > 0) {
            len = mx;
        } else {
            len = MIN(f.length, p.length);
        }
        for (int j = 0; j <len ; j ++) {
            if ([f characterAtIndex:j] != [p characterAtIndex:j]) {
                if (j == 0) {
                    return @"";
                } else {
                    return string;
                }
            } else {
                mx = MAX(mx, j);
                [string appendString:[NSString stringWithFormat:@"%c",[f characterAtIndex:j]]];
            }
        }
    }
    return string;
}

+ (NSString *)longestCommonPrefix2:(NSArray *)strs {
    NSString *pre = strs[0];
    NSInteger count = strs.count;

    for (int i = 1; i < count; i ++) {
        NSString *s = strs[i];
        while (![s containsString:pre]) {
            pre = [pre substringToIndex:pre.length -1];
            if (pre.length == 0) {
                return pre;
            }
        }
    }
    return pre;
}
// 水平扫描
+ (NSString *)longestCommonPrefix:(NSArray *)strs {
    NSString *first = strs[0];
    NSInteger len = first.length;
    NSInteger count = strs.count;

    for (int i = 0; i < len; i ++) {
        NSString *c = [first substringToIndex:i];
        for (int j = 1; j < count; j ++) {
            NSString *other = strs[j];
            NSString *f = [other substringToIndex:i];
            if (i == other.length || ![c isEqualToString:f]) {
                return [first substringToIndex:i -1];
            }
        }
    }
    return first;
}

@end

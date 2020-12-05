//
//  ViewController.m
//  YHDataStructureAndAlgorithm
//
//  Created by apple on 2019/6/22.
//  Copyright © 2019年 玉河川. All rights reserved.
//

#import "ViewController.h"
#import "YHLeetCode.h"
#import "YHBinarySearchTree.h"
#import "YHRBTree.h"
#import "MJBinaryTrees.h"
#import "YHInterview.h"
#import "YHOneLinked.h"
#import "YHListGraph.h"
#import "YHBinaryHeap.h"
#import "MJBinaryTrees.h"
#import "YHRecursive.h"
#import "YHBackTracking.h"
#import "YHGreedy.h"
#import "YHDynamicProgramming.h"
#import "YHBloomFilter.h"
#import "YHSkipList.h"
#import "YHSequence.h"
#import "YHSort.h"
#import "YHHeapSort.h"
#import "YHBubbleSort.h"
#import "YHSelectionSort.h"
#import "YHInsertionSort.h"
#import "YHBinarySearch.h"
#import "YHMergeSort.h"
#import "YHQuickSort.h"
#import "YHShellSort.h"
#import "YHCountingSort.h"
#import "YHDog.h"
#import "YHRadixSort.h"
#import "YHQuestions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test22];
    // Do any additional setup after loading the view, typically from a nib.
}
//2 1  2 3  2 3  4  3  4
- (void)test {
    YHOneLinked *linked = [[YHOneLinked alloc]init];
    [linked add:@"1"];
    [linked add:@"2"];
    [linked add:@"3"];
    [linked add:@"4"];
    [linked add:@"5"];
    [linked add:@"6"];
    [linked add:@"7"];
    [linked add:@"8"];
    
   // [YHInterview reverseList:linked->frist];
   [YHInterview reverseListTwo:linked->frist groupNum:3];
    NSLog(@"yuhechuan");
}

- (void)test1 {
    NSArray *arr = @[@(4),@(5),@(6),@(7),@(8),@(1),@(2),@(3)];
    NSInteger a = [YHInterview search:arr target:8];
    NSLog(@"%ld",(long)a);
}

- (void)test2 {
    
   // YHWeightManager *m = [[YHWeightManager alloc]init];
    YHWeightManager *m = [YHWeightManager new];

    m.comparator = ^BOOL(NSNumber *a, NSNumber *b) {
        return [a intValue] < [b intValue];
    };

    // Do any additional setup after loading the view.
    YHListGraph *graph = [[YHListGraph alloc]initWeightManager:m];
    [graph addEdge:@(3) to:@(7) weight:@(9)];
    [graph addEdge:@(7) to:@(3) weight:@(9)];
    
    [graph addEdge:@(5) to:@(7) weight:@(5)];
    [graph addEdge:@(7) to:@(5) weight:@(5)];
    
    [graph addEdge:@(5) to:@(1) weight:@(1)];
    [graph addEdge:@(1) to:@(5) weight:@(1)];
    
    [graph addEdge:@(5) to:@(6) weight:@(4)];
    [graph addEdge:@(6) to:@(5) weight:@(4)];
    
    [graph addEdge:@(5) to:@(2) weight:@(3)];
    [graph addEdge:@(2) to:@(5) weight:@(3)];

    [graph addEdge:@(1) to:@(6) weight:@(7)];
    [graph addEdge:@(6) to:@(1) weight:@(7)];

    [graph addEdge:@(1) to:@(2) weight:@(3)];
    [graph addEdge:@(2) to:@(1) weight:@(3)];

    [graph addEdge:@(6) to:@(2) weight:@(6)];
    [graph addEdge:@(2) to:@(6) weight:@(6)];
    
    [graph addEdge:@(6) to:@(4) weight:@(8)];
    [graph addEdge:@(4) to:@(6) weight:@(8)];
    
    [graph addEdge:@(2) to:@(4) weight:@(4)];
    [graph addEdge:@(4) to:@(2) weight:@(4)];
    
    [graph addEdge:@(2) to:@(0) weight:@(2)];
    [graph addEdge:@(0) to:@(2) weight:@(2)];
    
    [graph addEdge:@(0) to:@(4) weight:@(7)];
    [graph addEdge:@(4) to:@(0) weight:@(7)];
   
    NSLog(@"%@", [graph mst]);
}

- (void)test3 {
    YHComparator *c = [[YHComparator alloc]init];
    c.compare = ^BOOL(NSNumber *a, NSNumber *b) {
        return [a intValue] < [b intValue];
    };
    NSArray *e = @[@(68),@(72),@(43),@(50),@(38),@(10),@(95),@(65)];
    YHBinaryHeap *heap = [[YHBinaryHeap alloc]initWithComparator:c elements:e];
    [MJBinaryTrees print:heap];
}

- (void)test4 {
    NSArray *a = [YHInterview topK:@[@(68),@(72),@(43),@(50),@(38),@(10),@(95),@(65)] size:1];
    NSLog(@"%@",a);
}

- (void)test5 {
    YHWeightManager *m = [YHWeightManager new];
    m.comparator = ^BOOL(NSNumber *a, NSNumber *b) {
       return [a intValue] < [b intValue];
    };
    m.add = ^id(NSNumber *a, NSNumber *b) {
        return @([a intValue] + [b intValue]);
    };
    m.zero = ^id{
        return @(0);
    };
    
    YHListGraph *graph = [[YHListGraph alloc]initWeightManager:m];
    
//    [graph addEdge:@"A" to:@"E" weight:@(100)];
//    [graph addEdge:@"E" to:@"A" weight:@(100)];
//
//    [graph addEdge:@"A" to:@"B" weight:@(10)];
//    [graph addEdge:@"B" to:@"A" weight:@(10)];
//
//    [graph addEdge:@"A" to:@"D" weight:@(30)];
//    [graph addEdge:@"D" to:@"A" weight:@(30)];
//
//
//    [graph addEdge:@"D" to:@"E" weight:@(60)];
//    [graph addEdge:@"E" to:@"D" weight:@(60)];
//
//    [graph addEdge:@"D" to:@"C" weight:@(20)];
//    [graph addEdge:@"C" to:@"D" weight:@(20)];
//
//
//    [graph addEdge:@"B" to:@"C" weight:@(50)];
//    [graph addEdge:@"C" to:@"B" weight:@(50)];
//
//    [graph addEdge:@"C" to:@"E" weight:@(10)];
//    [graph addEdge:@"E" to:@"C" weight:@(10)];
    
    
    [graph addEdge:@"A" to:@"E" weight:@(100)];
    [graph addEdge:@"A" to:@"B" weight:@(10)];
    [graph addEdge:@"A" to:@"D" weight:@(30)];


    [graph addEdge:@"D" to:@"E" weight:@(60)];
    [graph addEdge:@"D" to:@"C" weight:@(20)];


    [graph addEdge:@"B" to:@"C" weight:@(50)];
    [graph addEdge:@"C" to:@"E" weight:@(10)];
    NSDictionary *dict = [graph allShortestPath];
    NSLog(@"%@", dict);
}

- (void)test6 {
    NSDictionary *dict = @{@"1":@"a",@"2":@"b",@"3":@"c",@"4":@"d",@"5":@"e"};
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"3"]) {
            return;
        }
        NSLog(@"yuhechuan =====%@",key);
    }];
}

- (void)test7 {
    YHRecursive *r = [YHRecursive new];
    NSLog(@"%d",[r fib0:10]);
    NSLog(@"%d",[r fib1:10]);
    NSLog(@"%d",[r fib2:10]);
    NSLog(@"%d",[r fib3:10]);
    NSLog(@"%d",[r fib4:10]);
    NSLog(@"%d",[r fib5:10]);
}

- (void)test8 {
    YHRecursive *r = [YHRecursive new];
    [r hanoi:3 p1:@"A" p2:@"B" p3:@"C"];
}

- (void)test9 {
    YHBackTracking *t = [[YHBackTracking alloc]init];
    [t place8Queen];
}

- (void)test10 {
    YHGreedy *g = [[YHGreedy alloc]init];
    [g coinChnage1];
}

- (void)test11 {
    YHDynamicProgramming *d = [[YHDynamicProgramming alloc]init];
    NSArray *f = @[@(1),@(5),@(20),@(25)];
    NSLog(@"%d",[d coinChange:41 faces:f]);
}

- (void)test12 {
    YHDynamicProgramming *d = [[YHDynamicProgramming alloc]init];
    NSArray *f = @[@(-2),@(1),@(-3),@(4),@(-1),@(2),@(1),@(-5),@(4)];
    NSLog(@"%d",[d maxLengthOfSubsequence:f]);
}

- (void)test13 {
    YHDynamicProgramming *d = [[YHDynamicProgramming alloc]init];

    NSArray *v =@[@(6),@(3),@(5),@(4),@(6)];
    NSArray *w =@[@(2),@(2),@(6),@(5),@(4)];
    int c = 10;
    NSLog(@"%d",[d maxValueExactly:v weights:w capacity:c]);
}

- (void)test14 {
    YHDynamicProgramming *d = [[YHDynamicProgramming alloc]init];

    NSString *v = @"A B D";
    NSString *w = @"D A B C";
    NSLog(@"%d",[d lcs:v str2:w]);
}


- (void)test15 {
    YHDynamicProgramming *d = [[YHDynamicProgramming alloc]init];
    NSArray *a = @[@(10),@(2),@(2),@(5),@(1),@(7),@(101),@(18)];
    NSLog(@"动规划 = %d",[d maxLengthOfIncreasingSubsequence:a]);
    NSLog(@"二分查找 = %d",[d maxLengthOfIncreasingSubsequence1:a]);
}

- (void)test16 {
    YHBloomFilter *filter = [[YHBloomFilter alloc]initScale:100000000 rate:0.01];
    for (int i = 0; i < 1000000; i ++) {
        [filter put: @(i)];
    }
    int count = 0;
    for (int i = 0; i < 1000000; i ++) {
        if ([filter contains:@(i)]) {
            count ++;
        }
    }


}

- (void)test17 {
    YHSkipComparator *c = [[YHSkipComparator alloc]init];
    c.compare = ^int(NSString  *_Nonnull a, NSString * _Nonnull b) {
        int av = [a intValue];
        int bv = [b intValue];
        if (av > bv) {
            return 1;
        } else if (av < bv) {
            return -1;
        } else {
            return 0;
        }
    };
    YHSkipList *skip  =[[YHSkipList alloc]initWithComparator:c];
    [self setSkipList:skip keys:100 delta:10];
}

- (void)setSkipList:(YHSkipList *)skip keys:(int)keys delta:(int)delta {
    for (int i = 0; i < keys; i ++) {
        NSString *key = [NSString stringWithFormat:@"%d",i];
        NSString *value = [NSString stringWithFormat:@"%d_%d",i,delta];
        [skip put:key value:value];
    }
    
    for (int i = 0; i < keys; i ++) {
        NSString *key = [NSString stringWithFormat:@"%d",i];
        NSString *value = [NSString stringWithFormat:@"%d_%d",i,delta];
        NSString *skipV = (NSString *)[skip get:key];
        if (![skipV isEqualToString:value]) {
            NSAssert(NO, @"不符合");
        }
    }
    
    NSLog(@"%@",skip.description);
    
    if (keys != [skip size]) {
        NSAssert(NO, @"不符合");
    }
    
    for (int i = 0; i < keys; i ++) {
       NSString *key = [NSString stringWithFormat:@"%d",i];
       NSString *value = [NSString stringWithFormat:@"%d_%d",i,delta];
       NSString *skipV = (NSString *)[skip remove:key];
       if (![skipV isEqualToString:value]) {
           NSAssert(NO, @"不符合");
       }
    }
    if (0 != [skip size]) {
        NSAssert(NO, @"不符合");
    }
}

- (void)test18 {
    YHSequence *s = [[YHSequence alloc]init];
    NSLog(@"%d",[s indexOf:@"AAABAAAAB" pattern:@"AAAAB"]);
}

- (void)test19 {
    YHComparator *c = [[YHComparator alloc]init];
    c.icompare = ^int(NSNumber  *_Nonnull a, NSNumber *_Nonnull b) {
        return [a intValue] - [b intValue];
    };
    YHSort *s1 = [[YHHeapSort alloc]initWithComparator:c];
    //YHSort *s2 = [[YHBubbleSort alloc]initWithComparator:c];
    //YHSort *s3 = [[YHSelectionSort alloc]initWithComparator:c];
    //YHSort *s4 = [[YHInsertionSort alloc]initWithComparator:c];
    YHSort *s5 = [[YHMergeSort alloc]initWithComparator:c];
    YHSort *s6 = [[YHQuickSort alloc]initWithComparator:c];
    //YHSort *s7 = [[YHShellSort alloc]initWithComparator:c];
    YHSort *s8 = [[YHCountingSort alloc]initWithInterger:^int(NSNumber * _Nonnull v) {
        return [v intValue];
    }];
    
    YHSort *s9 = [[YHRadixSort alloc]initWithInterger:^int(NSNumber * _Nonnull v) {
        return [v intValue];
    }];

    NSMutableArray *arr1 = [self romdomNumber:10000];
    //NSMutableArray *arr2 = arr1.mutableCopy;
    //NSMutableArray *arr3 = arr1.mutableCopy;
    //NSMutableArray *arr4 = arr1.mutableCopy;
    NSMutableArray *arr5 = arr1.mutableCopy;
    NSMutableArray *arr6 = arr1.mutableCopy;
    //NSMutableArray *arr7 = arr1.mutableCopy;
    NSMutableArray *arr8 = arr1.mutableCopy;
    NSMutableArray *arr9 = arr1.mutableCopy;


    
    [s1 sort:arr1];
    //[s2 sort:arr2];
    //[s3 sort:arr3];
    //[s4 sort:arr4];
    [s5 sort:arr5];
    [s6 sort:arr6];
   // [s7 sort:arr7];
    [s8 sort:arr8];
    [s9 sort:arr9];



    NSLog(@"%@",s1);
   // NSLog(@"%@",s2);
   // NSLog(@"%@",s3);
    //NSLog(@"%@",s4);
    NSLog(@"%@",s5);
    NSLog(@"%@",s6);
    //NSLog(@"%@",s7);
    NSLog(@"%@",s8);
    NSLog(@"%@",s9);
}


- (NSMutableArray *)romdomNumber:(int)count {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i ++) {
        [arr addObject:@(arc4random() % count)];
    }
    return arr;
}

- (void)test20 {
    NSArray *arr = @[@(1),@(3),@(5),@(7),@(9),@(12),@(20)];
    YHComparator *c = [[YHComparator alloc]init];
    c.icompare = ^int(NSNumber  *_Nonnull a, NSNumber *_Nonnull b) {
        return [a intValue] - [b intValue];
    };
    YHBinarySearch *s = [[YHBinarySearch alloc]initWithComparator:c];
    NSLog(@"%d",[s search:arr v:@(2)]);
    NSLog(@"%d",[s search:arr v:@(5)]);
    NSLog(@"%d",[s search:arr v:@(22)]);
    NSLog(@"%d",[s search:arr v:@(8)]);
    NSLog(@"%d",[s search:arr v:@(12)]);
}

- (void)test21 {
    NSMutableArray *arr = [self romdomNumber:20];
    NSMutableArray *dogs = [NSMutableArray array];
    for (int i = 0; i < arr.count; i ++) {
        YHDog *d = [[YHDog alloc]init];
        d.money = [arr[i] intValue];
        d.breed = [NSString stringWithFormat:@"品种%d",i];
        [dogs addObject:d];
    }
    
    YHSort *s = [[YHCountingSort alloc]initWithInterger:^int(YHDog * _Nonnull v) {
        return v.money;
    }];
    [s sort:dogs];
    NSLog(@"%@",s.sortArray);
}

- (void)test22 {
    NSArray *arr = [YHQuestions maxSlidingWindow:@[@(1),@(7),@(5),@(3),@(-1),@(-3),@(8),@(2)] k:3];
    NSLog(@"%@",arr);
}

@end

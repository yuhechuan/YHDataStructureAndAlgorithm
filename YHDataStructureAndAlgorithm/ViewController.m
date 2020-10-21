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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test10];
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


@end

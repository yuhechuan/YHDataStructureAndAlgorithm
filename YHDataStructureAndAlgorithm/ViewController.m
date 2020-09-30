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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test4];
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

    // Do any additional setup after loading the view.
    YHListGraph *graph = [[YHListGraph alloc]init];
    [graph addEdge:@(0) to:@(2)];
    
    [graph addEdge:@(2) to:@(6)];
    [graph addEdge:@(2) to:@(5)];
    
    [graph addEdge:@(6) to:@(4)];
    [graph addEdge:@(7) to:@(6)];
    [graph addEdge:@(5) to:@(7)];
    
    [graph addEdge:@(3) to:@(5)];
    [graph addEdge:@(3) to:@(7)];
    [graph addEdge:@(3) to:@(1)];
    
    [graph addEdge:@(1) to:@(0)];
    
    NSLog(@"%@", [graph topologicSort]);
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

@end

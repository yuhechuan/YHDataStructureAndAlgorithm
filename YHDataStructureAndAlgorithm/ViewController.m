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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
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


@end

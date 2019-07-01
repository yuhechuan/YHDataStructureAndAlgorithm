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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test {
    
    YHRBTree *rb = [[YHRBTree alloc]init];
    NSArray *arr = @[@(55), @(87), @(56), @(74),@(96),@(22), @(62),@(20), @(70), @(68), @(90), @(50)];
    for (NSNumber *n in arr) {
        [rb add:n];
    }
    [MJBinaryTrees println:rb];
}


@end

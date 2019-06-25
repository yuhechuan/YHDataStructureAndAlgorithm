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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test {
    YHBinarySearchTree *tree = [[YHBinarySearchTree alloc]init];
    [tree add:@(5)];
    [tree add:@(2)];
    [tree add:@(13)];
    
    [YHLeetCode convertBST:tree];
}


@end

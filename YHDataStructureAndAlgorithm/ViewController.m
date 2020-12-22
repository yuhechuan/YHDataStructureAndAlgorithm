//
//  ViewController.m
//  YHDataStructureAndAlgorithm
//
//  Created by apple on 2019/6/22.
//  Copyright © 2019年 玉河川. All rights reserved.
//

#import "ViewController.h"
#import "YHQuestionDFS.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test25];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)test25 {
   NSArray *arr = [YHQuestionDFS  combinationSum:@[@(2),@(3),@(6),@(7)] target:7];
    NSLog(@"%@",arr);
}


@end

//
//  ViewController.m
//  YHDataStructureAndAlgorithm
//
//  Created by apple on 2019/6/22.
//  Copyright © 2019年 玉河川. All rights reserved.
//

#import "ViewController.h"
#include <stdint.h>
#include <stdio.h>
#include <sanitizer/coverage_interface.h>
#import <dlfcn.h>
#import <libkern/OSAtomic.h> // 原子操作
#import "YHHighFrequency.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = @[@[@(1),@(2),@(3),@(4)],
                     @[@(4),@(5),@(6),@(7)],
                     @[@(8),@(9),@(10),@(11)]];
    
    NSArray *d = [YHHighFrequency spiralOrder:arr];
    NSLog(@"%@",d);
}

@end

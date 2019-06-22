//
//  YHBNote.m
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBNote.h"

@implementation YHBNote

- (instancetype)initWithElement:(id)e
                         parent:(YHBNote *)p {
    if (self = [super init]) {
        element = e;
        parent = p;
    }
    return self;
}

- (BOOL)isLeaf {
    return left == nil && right == nil;
}

- (BOOL)hasTwoChild {
    return left != nil && right != nil;
}

- (BOOL)isLeftChild {
    return  parent != nil && self == parent->left;
}

- (BOOL)isRightChild {
    return  parent != nil && self == parent->right;
}

@end

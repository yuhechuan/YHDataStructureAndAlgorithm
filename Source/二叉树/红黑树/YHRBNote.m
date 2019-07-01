//
//  YHRBNote.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/6/25.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHRBNote.h"

@implementation YHRBNote

- (instancetype)initWithElement:(id)element parent:(YHBNote *)parent {
    color = RED;
    return [super initWithElement:element parent:parent];
}

- (YHBNote *)color:(BOOL)c {
    if (!self) {
        return self;
    }
    YHRBNote *rb = (YHRBNote *)self;
    rb->color = c;
    return rb;
}

- (YHBNote *)red {
    return [self color:RED];
}

- (YHBNote *)black {
    return [self color:BLACK];
}

- (BOOL)colorOf {
    YHRBNote *rb = (YHRBNote *)self;
    return rb->color;
}

- (BOOL)isRed {
    YHRBNote *rb = (YHRBNote *)self;
    return rb->color == RED;
}

- (BOOL)isBlack {
    YHRBNote *rb = (YHRBNote *)self;
    return rb->color == BLACK;
}

- (YHBNote *)sibling {
    if ([self isLeftChild]) {
        return parent->right;
    }
    
    if ([self isRightChild]) {
        return parent->left;
    }
    return nil;
}

- (NSString *)description
{
    NSString *c = @"R";
    if (color) {
        c = @"B";
    }
    return [NSString stringWithFormat:@"%ld%@",(long)[element integerValue],c];
}

@end

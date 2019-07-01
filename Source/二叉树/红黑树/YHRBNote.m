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

+ (BOOL)colorOf:(YHBNote *)note {
    YHRBNote *rNote = (YHRBNote *)note;
    return !note ? BLACK :rNote->color;
}
+ (BOOL)isRed:(YHBNote *)note {
    return [self colorOf:note] == RED;
}
+ (BOOL)isBlack:(YHRBNote *)note {
    return [self colorOf:note] == BLACK;
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
    NSString *c = @"";
    if (color == RED) {
        c = @"R";
    }
    return [NSString stringWithFormat:@"%ld%@",(long)[element integerValue],c];
}

@end

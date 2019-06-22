//
//  YHAVLNote.m
//  算法
//
//  Created by ruaho on 2019/6/14.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHAVLNote.h"

@implementation YHAVLNote

- (instancetype)initWithElement:(id)element
                         parent:(YHBNote *)parent {
    height = 1;
   return [super initWithElement:element parent:parent];
}

/*
 平衡因子
 */
- (int)balanceFactor {
    YHAVLNote *l = (YHAVLNote *)left;
    YHAVLNote *r = (YHAVLNote *)right;
    int leftH = left ? l->height:0;
    int rightH = right ? r->height:0;
    return leftH - rightH;
}

/*
 更新高度
 */
- (void)updateHeight {
    YHAVLNote *l = (YHAVLNote *)left;
    YHAVLNote *r = (YHAVLNote *)right;
    int leftH = left ? l->height:0;
    int rightH = right ? r->height:0;
    height = MAX(leftH, rightH) +1;
}

/*
 返回较高的子树
 */
- (YHBNote *)tallerChild {
    YHAVLNote *l = (YHAVLNote *)left;
    YHAVLNote *r = (YHAVLNote *)right;
    int leftH = left ? l->height:0;
    int rightH = right ? r->height:0;
    
    if (leftH > rightH) return left;
    if (leftH < rightH) return right;
    return [self isLeftChild] ?left:right;
}

@end

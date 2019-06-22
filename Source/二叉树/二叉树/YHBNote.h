//
//  YHBNote.h
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHBNote : NSObject {
@public
    id element;
    YHBNote *left;   // 左子节点
    YHBNote *right;  // 右子节点
    YHBNote *parent; // 父节点
}

- (instancetype)initWithElement:(id)element
                         parent:(YHBNote *)parent;

/*
 是否是叶子节点
 */
- (BOOL)isLeaf;

/*
 是否有两个子节点
 */
- (BOOL)hasTwoChild;

/*
 是否是父节点的左节点
 */
- (BOOL)isLeftChild;

/*
 是否是父节点的右节点
 */
- (BOOL)isRightChild;

@end


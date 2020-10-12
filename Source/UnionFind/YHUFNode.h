//
//  YHUFNode.h
//  YHUnionFind
//
//  Created by yuhechuan on 2020/10/12.
//  Copyright © 2020 yuhechuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHUFNode : NSObject

@property (nonatomic, strong) id<NSCopying> value;
@property (nonatomic, strong) YHUFNode *parent;
@property (nonatomic, assign) int rank;
@property (nonatomic, assign) int size;

- (instancetype)initWithValue:(id<NSCopying>)value;

@end

NS_ASSUME_NONNULL_END

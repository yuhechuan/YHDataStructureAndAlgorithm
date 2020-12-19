//
//  YHNode.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/19.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YHNode : NSObject

@property (nonatomic, strong) YHNode *next;
@property (nonatomic, strong) id element;

@end

NS_ASSUME_NONNULL_END

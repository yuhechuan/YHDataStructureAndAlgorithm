//
//  YHMinNodeStack.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/12/5.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHComparator.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHMinNodeStack : NSObject

- (instancetype)initWithComparator:(YHComparator *)comparator;

- (void)push:(id)x;
- (void)pop;
- (id)top;
- (id)getMin;

@end

NS_ASSUME_NONNULL_END

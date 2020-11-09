//
//  YHSkipComparator.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/9.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef int(^SkipComparator)(id a,id b);

@interface YHSkipComparator : NSObject

@property (nonatomic, copy) SkipComparator compare;

@end

NS_ASSUME_NONNULL_END

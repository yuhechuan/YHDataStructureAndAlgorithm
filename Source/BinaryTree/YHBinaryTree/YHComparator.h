//
//  YHComparator.h
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef BOOL(^Comparator)(id a,id b);
typedef int(^IComparator)(id a,id b);

@interface YHComparator : NSObject

@property (nonatomic, copy) Comparator compare;
@property (nonatomic, copy) IComparator icompare;


@end

NS_ASSUME_NONNULL_END

//
//  YHDoubleLoopLinked.h
//  算法
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBaseLinked.h"

NS_ASSUME_NONNULL_BEGIN
/**
 * 双向循环链表
 */
@interface YHDoubleLoopLinked : YHBaseLinked

- (id)removeNote:(YHNote *)note;

@end

NS_ASSUME_NONNULL_END

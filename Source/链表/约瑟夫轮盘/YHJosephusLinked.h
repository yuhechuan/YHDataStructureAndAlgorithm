//
//  YHJosephusLinked.h
//  YHLinkedList
//
//  Created by ruaho on 2019/5/27.
//  Copyright © 2019 ruaho. All rights reserved.
//


#import "YHDoubleLoopLinked.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHJosephusLinked : YHDoubleLoopLinked {
    YHNote *current;
}

/*
 *current 指向头结点
 */
- (void)reset;

/*
 *current向前走几部
 */
- (id)next:(NSInteger)steps;


/*
 *删除current节点,并让current 指向下一节点
 */
- (id)removeCurrent;


@end

NS_ASSUME_NONNULL_END

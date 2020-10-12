//
//  YHAVLNote.h
//  算法
//
//  Created by ruaho on 2019/6/14.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBNote.h"

NS_ASSUME_NONNULL_BEGIN

@interface YHAVLNote : YHBNote {
    int height;
}

/*
 平衡因子
 */
- (int)balanceFactor;
/*
 更新高度
 */
- (void)updateHeight;

/*
 返回较高的子树
 */
- (YHBNote *)tallerChild;

@end

NS_ASSUME_NONNULL_END

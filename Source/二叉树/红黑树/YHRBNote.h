//
//  YHRBNote.h
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/6/25.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHBNote.h"

static const BOOL RED = NO;                      // 红色
static const BOOL BLACK = YES;                     // 黑色

NS_ASSUME_NONNULL_BEGIN

@interface YHRBNote : YHBNote {
@public;
    BOOL color;
}

+ (YHRBNote *)color:(YHRBNote *)note c:(BOOL)c;
+ (YHRBNote *)red:(YHRBNote *)note;
+ (YHRBNote *)black:(YHRBNote *)note;
+ (BOOL)colorOf:(YHRBNote *)note;
+ (BOOL)isRed:(YHRBNote *)note;
+ (BOOL)isBlack:(YHRBNote *)note;


@end

NS_ASSUME_NONNULL_END

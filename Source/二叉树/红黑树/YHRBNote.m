//
//  YHRBNote.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/6/25.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHRBNote.h"

@implementation YHRBNote

+ (YHRBNote *)color:(YHRBNote *)note
                  c:(BOOL)c {
    if (!note) {
        return note;
    }
    note->color = c;
    return note;
}

+ (YHRBNote *)red:(YHRBNote *)note {
    return [self color:note c:RED];
}

+ (YHRBNote *)black:(YHRBNote *)note {
    return [self color:note c:BLACK];
}

+ (BOOL)colorOf:(YHRBNote *)note {
    return note->color;
}

+ (BOOL)isRed:(YHRBNote *)note {
    return note->color == RED;
}

+ (BOOL)isBlack:(YHRBNote *)note {
    return note->color == BLACK;
}

@end

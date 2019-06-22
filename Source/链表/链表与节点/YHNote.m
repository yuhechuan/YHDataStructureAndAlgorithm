//
//  YHNote.m
//  算法
//
//  Created by ruaho on 2019/5/22.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHNote.h"

@implementation YHNote

- (instancetype)initWithElement:(id)e
                           next:(YHNote *)n {
    if (self = [super init]) {
        element = e;
        next = n;
    }
    return self;
}
- (instancetype)initWithPrev:(YHNote *)p
                     element:(id)e
                        next:(YHNote *)n {
    if (self = [super init]) {
        prev = p;
        element = e;
        next = n;
    }
    return self;
}

- (NSString *)description {
    NSMutableString *s = [NSMutableString string];
    if (prev != nil) {
        [s appendString:prev->element];
    } else {
        [s appendString:@"nil"];
    }
    
    [s appendFormat:@"_%@_",element];
    
    if (next != nil) {
        [s appendString:next->element];
    } else {
        [s appendString:@"nil"];
    }
    return [s copy];
}

@end

//
//  YHNote.h
//  算法
//
//  Created by ruaho on 2019/5/22.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YHNote : NSObject {
@public
    YHNote *next;   //前指针
    YHNote *prev;   //后指针
    id element;
}

- (instancetype)initWithElement:(id)e
                           next:(YHNote *)n;

- (instancetype)initWithPrev:(YHNote *)p
                     element:(id)e
                        next:(YHNote *)n;
@end


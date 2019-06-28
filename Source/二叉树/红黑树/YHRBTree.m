//
//  YHRBTree.m
//  YHDataStructureAndAlgorithm
//
//  Created by ruaho on 2019/6/25.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import "YHRBTree.h"
#import "YHRBNote.h"

@implementation YHRBTree


- (void)afterAdd:(YHBNote *)note {
    YHRBNote *parent = (YHRBNote *)note->parent;
    if (parent == nil) {
        [YHRBNote black:(YHRBNote *)note];
        return;
    }
    
}

- (void)afterRemove:(YHBNote *)note {
    
}


- (YHBNote *)creatNote:(id)element
                parent:(YHBNote *)parent {
    YHRBNote *newNote = [[YHRBNote alloc]initWithElement:element
                                                  parent:parent];
    return newNote;
}

@end

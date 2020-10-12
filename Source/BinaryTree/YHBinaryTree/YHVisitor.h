//
//  YHVisitor.h
//  算法
//
//  Created by ruaho on 2019/6/13.
//  Copyright © 2019 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef BOOL(^Visitor)(id object);

@interface YHVisitor : NSObject

@property (nonatomic, copy) Visitor visit;
@property (nonatomic, assign) BOOL isStop;

@end

NS_ASSUME_NONNULL_END

//
//  YHB+Tree.h
//  YHDataStructureAndAlgorithm
//
//  Created by admin on 2020/11/10.
//  Copyright © 2020 玉河川. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * B+ 树 MySquel数据库的索引
 * 数据库是以文件的形式存储在硬盘的
 * 机械硬盘 : 盘片 盘面 读写磁头
 * 扇区是 硬盘最小读写单位  磁盘块是操作系统最小的 读写单位
 * 磁盘块: 4096字节 由 8个连续的的512字节的扇区组成
 * 访问数据时间
 *  1.寻道时间:降读写磁头移动到正确的磁道上所需的时间 这部分时间代价最高 (seek)
 *  2.旋转延迟时间:盘片旋转将目标扇区移动到读写磁头下方所需时间 取决于磁盘转速 (rotation)
 *  3.数据传输时间 :完成传输数据所需时间 取决于接口的数据传输率 通常远小于 上面两部分所耗时间 (transfer)
 *
 * MySquel数据库的索引 底层
 *  为了提高IO效率 减少IO操作
 *
 */
@interface YHB_Tree : NSObject

@end

NS_ASSUME_NONNULL_END

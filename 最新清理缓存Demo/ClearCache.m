//
//  ClearCacheView.m
//  最新清理缓存Demo
//
//  Created by 孙云 on 15/11/2.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import "ClearCache.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation ClearCache
/**
 *  缓存文件路径
 *
 *  //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
 //NSString *cacheDirectory = [paths objectAtIndex:0];
 //NSString *filePath =[documentsDirectory stringByAppendingPathComponent:fileName];
 */

/**
 *  计算文件大小
 *
 *  @param path <#path description#>
 *
 *  @return <#return value description#>
 */
+(float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}
/**
 *  计算目录大小
 *
 *  @param path <#path description#>
 *
 *  @return <#return value description#>
 */
+(float)folderSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            folderSize +=[self fileSizeAtPath:absolutePath];
        }
         //SDWebImage框架自身计算缓存的实现
        folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
        return folderSize;
    }
    return 0;
}
/**
 *  清除文件缓存
 *
 *  @param path <#path description#>
 */
+(void)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
}
@end

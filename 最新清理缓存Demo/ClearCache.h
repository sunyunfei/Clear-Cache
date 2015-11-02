//
//  ClearCacheView.h
//  最新清理缓存Demo
//
//  Created by 孙云 on 15/11/2.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClearCache : NSObject

+(float)fileSizeAtPath:(NSString *)path;
+(float)folderSizeAtPath:(NSString *)path;
+(void)clearCache:(NSString *)path;
@end

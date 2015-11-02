//
//  ViewController.m
//  最新清理缓存Demo
//
//  Created by 孙云 on 15/11/2.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "ClearCache.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = @"http://pic.nipic.com/2007-10-25/2007102585630254_2.jpg";
    UIImageView *image = [[UIImageView alloc]initWithFrame:self.view.bounds];
    [image sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    [self.view addSubview:image];
    
    //找到缓存文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //输出缓存路径
    NSLog(@"%@",documentsDirectory);
    
    //计算缓存文件大小
    CGFloat count = [ClearCache folderSizeAtPath:documentsDirectory];
    NSLog(@"%.2f",count);
    // 清除缓存
    //[ClearCache clearCache:documentsDirectory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

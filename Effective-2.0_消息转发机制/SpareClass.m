/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//  SpareClass.m
//  Effective-2.0_消息转发机制
//
//  Created by 刘一峰 on 2017/7/17.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "SpareClass.h"

@implementation SpareClass
- (NSString *)targetMethod:(NSString *)str {
    NSLog(@"备援接受者");
    NSLog(@"%@",str);
    return @"添加返回值";
}

- (void)otherMethod {
    NSLog(@"替换消息");
}
@end

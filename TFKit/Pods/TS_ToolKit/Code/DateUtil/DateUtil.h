//
//  DateUtil.h
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/7/26.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+ (DateUtil *)shared;

#pragma mark --- 秒时间戳
- (NSString *)getTimeStamp_s;
#pragma mark --- 毫秒时间戳
- (NSString *)getTimeStamp_ms;

@end

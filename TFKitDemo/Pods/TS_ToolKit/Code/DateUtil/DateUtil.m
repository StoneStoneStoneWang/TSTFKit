//
//  DateUtil.m
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/7/26.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "DateUtil.h"

static DateUtil *instance = nil;

@implementation DateUtil

+ (DateUtil *)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [DateUtil new];
    });
    
    return instance;
}
- (NSString *)getTimeStamp_s {
    
    return [NSString stringWithFormat:@"%d",(int)[NSDate date].timeIntervalSince1970];
}
- (NSString *)getTimeStamp_ms {
    
    return [NSString stringWithFormat:@"%llu",(UInt64)([NSDate date].timeIntervalSince1970 * 1000) ];
}
@end

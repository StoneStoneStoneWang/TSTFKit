//
//  NSString+ConvertDate.h
//  JiuTouZhu
//
//  Created by three stone 王 on 2018/7/22.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger ,TSDateType) {
    
    TSDateTypeFullStyle , // yyyy-MM-dd hh:mm:ss
    
    TSDateTypeLongStyle, // yyyy-MM-dd hh:mm
    
    TSDateTypeDateStyle  // 下一个是时间 几分钟前。。 昨天 几天前
};

@interface NSString (ConvertDate)

- (NSString *)convertToDate;

- (NSString *)convertToDate:(TSDateType )type;

@end

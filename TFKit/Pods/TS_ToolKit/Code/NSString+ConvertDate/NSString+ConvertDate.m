//
//  NSString+ConvertDate.m
//  JiuTouZhu
//
//  Created by three stone 王 on 2018/7/22.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NSString+ConvertDate.h"

@implementation NSString (ConvertDate)

- (NSString *)convertToDate {
    
    NSTimeInterval interval    = [self doubleValue];
    
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"MM.dd HH:mm"];
    
    NSString *dateString       = [formatter stringFromDate: date];
    
    return dateString;
}

- (NSString *)convertToDate:(TSDateType)type {
    
    NSTimeInterval interval = [self doubleValue];
    
    switch (type) {
        case TSDateTypeFullStyle:
        {
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            
            [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
            
            NSString *dateString = [formatter stringFromDate: date];
            
            return dateString;
        }
        case TSDateTypeLongStyle:
        {
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            
            [formatter setDateFormat:@"yyyy-MM-dd   hh:mm"];
            
            NSString *dateString = [formatter stringFromDate: date];
            
            return dateString;
        }
        case TSDateTypeDateStyle:
        {
            
            NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
            // 创建歌曲时间戳(后台返回的时间 一般是13位数字)
            // 时间差
            NSTimeInterval time = currentTime - interval;
            
            NSInteger seconds = time;
            if (time < 60) {
                
                return [NSString stringWithFormat:@"%ld秒前",seconds];
            }
            // 秒转分钟
            
            NSInteger minutes = time / 60;
            
            if (minutes < 60) {
                
                return [NSString stringWithFormat:@"%ld分钟前",minutes];
            }
            // 秒转小时
            NSInteger hours = time/3600;
            
            if (hours<24) {
                
                return [NSString stringWithFormat:@"%ld小时前",hours];
            }
            //秒转天数
            
            return [self convertToDate:TSDateTypeLongStyle];
            //            NSInteger days = time/3600/24;
            //
            //            if (days < 30) {
            //
            //                return [NSString stringWithFormat:@"%ld天前",days];
            //            }
            //            //秒转月
            //            NSInteger months = time/3600/24/30;
            //            if (months < 12) {
            //                return [NSString stringWithFormat:@"%ld月前",months];
            //            }
            //            //秒转年
            //            NSInteger years = time/3600/24/30/12;
            //
            //            return [NSString stringWithFormat:@"%ld年前",years];
        }
    }
}
@end

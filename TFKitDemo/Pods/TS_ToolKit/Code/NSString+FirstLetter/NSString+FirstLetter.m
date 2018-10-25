//
//  NSString+FirstLetter.m
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/9/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)

- (NSString *)firstLetter {
    
    if (self && [self length]) {
        
        return [self substringToIndex:1];
    }
    return @"";
}
- (NSString *)pinyin {
    
    NSString  * pinYinStr = [NSString string];
    if (self.length){
        NSMutableString * pinYin = [[NSMutableString alloc]initWithString:self];
        
        //先转换为带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, 0, kCFStringTransformMandarinLatin, NO)) {
//            NSLog(@"pinyin: %@", pinYin);
        }
        
        //再转换为不带声调的拼音
        if (CFStringTransform((__bridge CFMutableStringRef)pinYin, 0, kCFStringTransformStripDiacritics, NO)) {
//            NSLog(@"pinyin: %@", pinYin);
            
            //再去除空格，将拼音连在一起
            pinYinStr = [NSString stringWithString:pinYin];
            
            // 去除掉首尾的空白字符和换行字符
            pinYinStr = [pinYinStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            // 去除掉其它位置的空白字符和换行字符
            pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            pinYinStr = [pinYinStr stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
    }
    return pinYinStr;
}
@end

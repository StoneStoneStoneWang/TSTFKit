//
//  NSString+ByteLength.m
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/10/25.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NSString+ByteLength.h"

@implementation NSString (ByteLength)

- (NSInteger)byteLengh {
    
    NSInteger le = self.length;
    
    NSString *pattern = @"[\u4e00-\u9fa5]";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:(NSRegularExpressionCaseInsensitive) error:nil];
    
    NSInteger match = [regex numberOfMatchesInString:self options:NSMatchingReportProgress range:NSMakeRange(0, le)];
    
    return match;
}

- (NSInteger )getCharacterLengthFromStr {
    
    NSInteger le = 0;
    
    char *p = (char *)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    
    for (int i = 0; i < [self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        
        if (*p) {
            
            p++;
            
            le++;
        } else {
            
            p++;
        }
    }
    return le;
}
@end

//
//  NSString+ByteLength.h
//  TS_ToolKit
//
//  Created by three stone 王 on 2018/10/25.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// 计算中文长度
@interface NSString (ByteLength)
// emoji 按照2个字符算
- (NSInteger)byteLengh;

// unicode 按照四个字符算

- (NSInteger )getCharacterLengthFromStr;

@end

NS_ASSUME_NONNULL_END

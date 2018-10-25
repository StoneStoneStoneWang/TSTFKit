//
//  NSString+Util.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)
/** 如果为nil 或者空字符串返回 true */
+ (BOOL)isEmpty:(NSString *)string;

/** 只能判断字符串是否为空字符串"" 不能判断为不为nil 或者null */

- (BOOL)isEmpty;

/*
 手机号验证
 @param phone 如果phone为nil false 如果首位为1且长度为11位 为true  没有加入正则表达式
 */

+ (BOOL)validPhone:(NSString *)phone;

- (BOOL)validPhone;

/*
 邮箱验证
 @param email 如果email为nil 返回false 正则表达式
 */
+ (BOOL)validEmail:(NSString *)email;

- (BOOL)validEmail;
/*
 车牌号验证
 @param carNo 如果 carNo 为 nil 返回false 正则表达式
 */
+ (BOOL)validateCarNo:(NSString *)carNo;

- (BOOL)validateCarNo;

@end

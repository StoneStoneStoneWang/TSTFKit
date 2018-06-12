//
//  TFDefines.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
// 一般情况下 登陆注册 都是左边icon 右边输入文本
typedef NS_ENUM(NSInteger, TextFieldEditType) {
    TextFieldEditTypePhone, // 手机号
    TextFieldEditTypeSecret, // 密码
    TextFieldEditTypeVCode_Length4, // 4位验证码
    TextFieldEditTypeVCode_Length6, // 6位验证码
    TextFieldEditTypePriceEdit,  // 价格输入
    TextFieldEditTypeDetault
};


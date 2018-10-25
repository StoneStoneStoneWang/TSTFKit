//
//  TFDefines.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 文本框内容 样式 */
typedef NS_ENUM(NSInteger, TextFieldEditType) {
    
    /** 手机号 默认判断是长度11位 首位为1的+86手机号 如果是复制过去的 加入了-处理机制 比如从通讯录复制*/
    TextFieldEditTypePhone,
    /** 密码 暗文 secureTextEntry true 6-18位*/
    TextFieldEditTypeSecret,
    /** 4位验证码 */
    TextFieldEditTypeVCode_Length4,
    /** 6位验证码 */
    TextFieldEditTypeVCode_Length6,
    /** 价格输入  小数点后2位*/
    TextFieldEditTypePriceEdit,
    /** 默认 */
    TextFieldEditTypeDetault,
    /** 文本内容规定长度 比如只能输入2-10个字符 */
    TextFieldEditTypeContentDefineLength,
};


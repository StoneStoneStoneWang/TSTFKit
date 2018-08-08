//
//  TSTextField.h
//  TFKit
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSTextFieldDelegate.h"

#import "TFDefines.h"

// 基类 仅初始化与处理事件
@interface TSTextField : UITextField

/** 文本框代理  */

@property (nonatomic,weak) id<TSTextFieldDelegate> mDelegate;

/** 文本框顶部line 颜色  */
@property (nonatomic ,strong) UIColor *topLineColor;
/** 文本框底部line 颜色  */
@property (nonatomic ,strong) UIColor *bottomLineColor;
// 最大长度
@property (nonatomic,assign) int maxLength;

#pragma mark --- 初始化属性
- (void)commitInit;

// 设置类型 参考枚举定义
- (void)makeEditType:(TextFieldEditType)type;

@end

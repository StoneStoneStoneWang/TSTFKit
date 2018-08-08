//
//  TFLeftTitleTF.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSTextField.h"

@interface TFLeftTitleTF : TSTextField
/** 左部标题  */
@property (nonatomic ,copy) NSString *leftTitle;
/** 左部标题 富文本*/
@property (nonatomic ,strong) NSAttributedString *leftTitleAttr;
/** 左部标题 frame */
@property (nonatomic ,assign) CGRect leftLabelFrame;
/** 也可以在下面的函数中设置 子类继承 重写*/
- (CGRect)leftViewRectForBounds:(CGRect)bounds;
/** 文本编辑区域 子类继承 重写*/
- (CGRect)textRectForBounds:(CGRect)bounds;

@end

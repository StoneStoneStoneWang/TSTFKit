//
//  TFLeftImageTF.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSTextField.h"

@interface TFLeftImageTF : TSTextField
/** 左部icon  */
@property (nonatomic ,strong) UIImage *leftImage;
/** 左部icon frame  */
@property (nonatomic ,assign) CGRect leftImageViewFrame;
/** 也可以在下面的函数中设置 子类继承 重写*/
- (CGRect)leftViewRectForBounds:(CGRect)bounds;
/** 文本编辑区域  子类继承 重写 */
- (CGRect)textRectForBounds:(CGRect)bounds;

@end

//
//  TSTextField.m
//  TFKit
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSTextField.h"

#define Top_Line_Tag 1001

#define Bottom_Line_Tag 1002

#define myDotNumbers     @"0123456789.\n"

#define myNumbers          @"0123456789\n"
// 小数点后最多两位
#define DotDecimal 2

@interface TSTextField() <UITextFieldDelegate>

@property (nonatomic ,strong) UIImageView *topLine;

@property (nonatomic ,strong) UIImageView *bottomLine;

@property (nonatomic ,assign) TextFieldEditType type;

@property (nonatomic ,assign) BOOL hasDot;

@end

@implementation TSTextField

- (void)makeEditType:(enum TextFieldEditType)type {
    
    self.type = type;
    
    self.secureTextEntry = false;
    // 返回按钮类型
    self.returnKeyType = UIReturnKeyDone;
    // 键盘类型
    self.keyboardType = UIKeyboardTypeDefault;
    
    switch (self.type) {
        case TextFieldEditTypeSecret:
        {
            self.secureTextEntry = true;
            
            self.maxLength = 18;
        }
            break;
        case TextFieldEditTypePhone:
        {
            self.keyboardType = UIKeyboardTypeNumberPad;
            
            self.maxLength = 11;
        }
            break;
        case TextFieldEditTypeVCode_Length4:
        {
            self.keyboardType = UIKeyboardTypeNumberPad;
            
            self.maxLength = 4;
        }
            break;
        case TextFieldEditTypeVCode_Length6:
        {
            self.keyboardType = UIKeyboardTypeNumberPad;
            
            self.maxLength = 6;
        }
            break;
        case TextFieldEditTypePriceEdit:
        {
            self.keyboardType = UIKeyboardTypeDecimalPad;
            
            self.maxLength = 10;
        }
            break;
        case TextFieldEditTypeDetault:
        {
            
            self.maxLength = 99;
        }
            break;
        default:
            break;
    }
}

- (UIImageView *)topLine {
    
    if (!_topLine) {
        
        _topLine = [UIImageView new];
        
        _topLine.tag = Top_Line_Tag;
    }
    return _topLine;
}

- (UIImageView *)bottomLine {
    
    if (!_bottomLine) {
        
        _bottomLine = [UIImageView new];
        
        _bottomLine.tag = Bottom_Line_Tag;
    }
    return _bottomLine;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self commitInit];
    }
    return self;
}
- (void)commitInit {
    // 设置代理
    self.delegate = self;
    
    // 字体
    self.font = [UIFont systemFontOfSize:15];
    // 背景颜色
    self.backgroundColor = [UIColor clearColor];
    // 清除按钮类型
    self.clearButtonMode = UITextFieldViewModeAlways;
    // 当文本发生改变时 添加 onEditChanged事件
    [self addTarget:self action:@selector(onEditChanged:) forControlEvents:UIControlEventEditingChanged];
    // 文本最长长度
    self.maxLength = 99;
    
    [self addSubview:self.topLine];
    
    [self addSubview:self.bottomLine];
    
    self.type = TextFieldEditTypeDetault;
    
    self.hasDot = false;
}

#pragma mark --- UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField  resignFirstResponder];
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(textFieldReturn:)]) {
        
        [_mDelegate textFieldReturn:textField];
    }
    
    return true;
}

- (void)onEditChanged:(UITextField *)tf {
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(textFieldReturn:)]) {
        
        [_mDelegate textField:tf onEditChanged:tf.text];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    switch (self.type) {
        case TextFieldEditTypePhone:
        case TextFieldEditTypeVCode_Length4:
        case TextFieldEditTypeVCode_Length6:
            return range.length == 1 && string.length == 0 ? true : textField.text.length < self.maxLength;
        case TextFieldEditTypePriceEdit:
        {
            NSCharacterSet *cs;
            
            NSUInteger nDotLoc = [textField.text rangeOfString:@"."].location;
            
            if (NSNotFound == nDotLoc && 0 != range.location) {
                
                cs = [[NSCharacterSet characterSetWithCharactersInString:myDotNumbers] invertedSet];
            }
            else {
                cs = [[NSCharacterSet characterSetWithCharactersInString:myNumbers] invertedSet];
            }
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if (!basicTest) {
                //               只能输入数字和小数点
                return false;
            }
            if (NSNotFound != nDotLoc && range.location > nDotLoc + DotDecimal) {
                //                小数点后最多2位
                return false;
            }
        }
        default:
            break;
    }
    
    return self.maxLength;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.topLine.frame = CGRectMake(0, 0, self.bounds.size.width, 1);
    
    self.bottomLine.frame = CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1);
}
#pragma mark --- 设置 编辑区域
- (CGRect)editingRectForBounds:(CGRect)bounds {
    
    return [super editingRectForBounds:bounds];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    
    return [super textRectForBounds:bounds];
}

@end

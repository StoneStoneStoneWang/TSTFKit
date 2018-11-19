//
//  TSTextField.m
//  TFKit
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSTextField.h"
#import "NSString+ByteLength.h"
#define Top_Line_Tag 1001

#define Bottom_Line_Tag 1002

BOOL __handlePattern(NSString *content, NSString *pattern) {
    
    NSError *error;
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:&error];
    
    if (error) { return YES; }
    
    NSArray *results = [regex matchesInString:content options:0 range:NSMakeRange(0, content.length)];
    
    return results.count > 0;
}

BOOL __shouldChangeCharactersIn(TSTextField *target, NSRange range, NSString *string) {

    //计算若输入成功的字符串
    NSString *nowStr = target.text;
    
    NSMutableString *resultStr = [NSMutableString stringWithString:nowStr];
    
    if (string.length == 0) {
        
        [resultStr deleteCharactersInRange:range];
    } else {
        if (range.length == 0) {
            [resultStr insertString:string atIndex:range.location];
        } else {
            [resultStr replaceCharactersInRange:range withString:string];
        }
    }
    //长度判断
    if (target.maxLength != NSUIntegerMax) {
        
        if (resultStr.length > target.maxLength) {
            
            return false;
        }
    }
    
    //正则表达式匹配
    if (resultStr.length > 0) {
        
        if (target.pattern.length <= 0) {
            
            return true;
        }
        
        return __handlePattern(resultStr, target.pattern);
    }
    return YES;
}

void __textDidChange(TSTextField *target) {
    
    //内容适配
    if (target.maxLength != NSUIntegerMax && [target valueForKey:@"markedTextRange"] == nil) {
        NSString *resultText = [target valueForKey:@"text"];
        if (target.type == TextFieldEditTypeContentDefineLength) {
            
            resultText = [[target valueForKey:@"text"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        }
        
        //再判断长度
        if (resultText.length > target.maxLength) {
            [target setValue:[resultText substringToIndex:target.maxLength] forKey:@"text"];
        } else {
            [target setValue:resultText forKey:@"text"];
        }
    }
    //回调
    if (target.textChanged) {
        
        target.textChanged(target);
    }
}

@interface TSTextField() <UITextFieldDelegate>

@property (nonatomic ,strong) UIImageView *topLine;

@property (nonatomic ,strong) UIImageView *bottomLine;

@property (nonatomic ,assign ,readwrite) TextFieldEditType type;

@property (nonatomic ,assign) BOOL hasDot;

@end

@implementation TSTextField

+ (instancetype)textField {
    
    return [[self alloc] initWithFrame:CGRectZero];
}
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
            
            self.keyboardType = UIKeyboardTypeASCIICapable;
            
            self.pattern = @"^[0-9a-zA-Z]*$";
        }
            break;
        case TextFieldEditTypePhone:
        {
            self.keyboardType = UIKeyboardTypeNumberPad;
            
            self.pattern = @"^[0-9]*$";
            
            self.maxLength = 11;
        }
            break;
        case TextFieldEditTypeVCode_Length4:
        {
            self.keyboardType = UIKeyboardTypeNumberPad;
            
            self.maxLength = 4;
            
            self.pattern = @"^[0-9]*$";
        }
            break;
        case TextFieldEditTypeVCode_Length6:
        {
            self.keyboardType = UIKeyboardTypeNumberPad;
            
            self.pattern = @"^[0-9]*$";
            
            self.maxLength = 6;
        }
            break;
        case TextFieldEditTypePriceEdit:
        {
            self.keyboardType = UIKeyboardTypeDecimalPad;
            
            self.maxLength = 10;
            
            self.pattern = [NSString stringWithFormat:@"^(([1-9]\\d{0,%ld})|0)(\\.\\d{0,2})?$", (long)self.maxLength];
        }
            break;
        case TextFieldEditTypeDetault:
        {
            self.maxLength = NSUIntegerMax;
        }
            break;
        case TextFieldEditTypeContentDefineLength:
            
            self.maxLength = 10;
            
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
    
    self.maxLength = NSUIntegerMax;
    // 字体
    self.font = [UIFont systemFontOfSize:15];
    // 背景颜色
    self.backgroundColor = [UIColor clearColor];
    // 清除按钮类型
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
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

- (void)onEditChanged:(UITextField *)textField {
    
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (position) return;
    
    __textDidChange((TSTextField *)textField);
}

- (void)setTextChanged:(TSTextChangedBlock)textChanged {
    
    _textChanged = textChanged;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    return self.maxLength;
}
- (void)setBottomLineColor:(UIColor *)bottomLineColor {
    _bottomLineColor = bottomLineColor;
    
    self.bottomLine.backgroundColor = bottomLineColor;
}
- (void)setTopLineColor:(UIColor *)topLineColor {
    _topLineColor = topLineColor;
    
    self.topLine.backgroundColor = topLineColor;
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

//
//  TFLeftTitleTF.m
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TFLeftTitleTF.h"
@interface TFLeftTitleTF()

@property (nonatomic ,strong) UILabel *leftLabel;

@end

@implementation TFLeftTitleTF

- (UILabel *)leftLabel {
    
    if (!_leftLabel) {
        
        _leftLabel = [UILabel new];
        
        _leftLabel.font = [UIFont systemFontOfSize:15];
        
        _leftLabel.textColor = [UIColor blackColor];
        
        _leftLabel.userInteractionEnabled = false;
        
    }
    return _leftLabel;
}

- (void)commitInit {
    [super commitInit];
    
    self.leftView = self.leftLabel;
    
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.leftLabelFrame = CGRectMake(0, 0, 80, 48);
}
- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    self.leftLabel.text = leftTitle;
}

- (void)setLeftTitleAttr:(NSAttributedString *)leftTitleAttr {
    _leftTitleAttr = leftTitleAttr;
    
    self.leftLabel.attributedText = leftTitleAttr;
}
- (void)setLeftLabelFrame:(CGRect)leftLabelFrame {
    _leftLabelFrame = leftLabelFrame;
    
    self.leftLabel.frame = leftLabelFrame;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    return [super leftViewRectForBounds:bounds];
}
- (CGRect)textRectForBounds:(CGRect)bounds{
    return [super textRectForBounds:bounds];
}

@end

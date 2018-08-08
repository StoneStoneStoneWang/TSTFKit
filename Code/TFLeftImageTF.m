//
//  TFLeftImageTF.m
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TFLeftImageTF.h"
@interface TFLeftImageTF()

@property (nonatomic ,strong) UIImageView *leftImageView;

@end

@implementation TFLeftImageTF

- (UIImageView *)leftImageView {
    
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        
        _leftImageView.contentMode = UIViewContentModeCenter;
    }
    return _leftImageView;
}
- (void)commitInit {
    [super commitInit];
    
    self.leftView = self.leftImageView;
    
    self.leftViewMode = UITextFieldViewModeAlways;
    
    self.leftImageViewFrame = CGRectMake(0, 0, 40, 48);
}

- (void)setLeftImage:(UIImage *)leftImage {
    _leftImage = leftImage;
    
    self.leftImageView.image = leftImage;
}

- (void)setLeftImageViewFrame:(CGRect)leftImageViewFrame {
    _leftImageViewFrame = leftImageViewFrame;
    
    self.leftImageView.frame = leftImageViewFrame;
}
- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    return [super leftViewRectForBounds:bounds];
}
- (CGRect)textRectForBounds:(CGRect)bounds{
    return [super textRectForBounds:bounds];
}
@end

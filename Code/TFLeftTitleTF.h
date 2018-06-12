//
//  TFLeftTitleTF.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSTextField.h"

@interface TFLeftTitleTF : TSTextField

@property (nonatomic ,copy) NSString *leftTitle;

@property (nonatomic ,strong) NSAttributedString *leftTitleAttr;

@property (nonatomic ,assign) CGRect leftLabelFrame;

@end

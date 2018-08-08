//
//  TSTextFieldDelegate.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/11.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TSTextFieldDelegate <NSObject>

- (void)textField:(UITextField *)tf onEditChanged:(NSString *)text;

- (void)textFieldReturn:(UITextField *)textField;

@end

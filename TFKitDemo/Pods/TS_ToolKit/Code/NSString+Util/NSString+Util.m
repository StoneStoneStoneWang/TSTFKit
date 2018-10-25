//
//  NSString+Util.m
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

+ (BOOL)isEmpty:(NSString *)string {
    
    if (string == nil || string == NULL)
        return true;
    
    return [string isEmpty];
}

- (BOOL)isEmpty {
    
    return self.length == 0;
}

+ (BOOL)validPhone:(NSString *)phone {
    
    if (phone == nil || phone == NULL)
        return false;
    
    return [phone validPhone];
}

// 因为号段 这个 三大运营商 随时加号段。所以前端只需强制判断 长度为11 且首位为1
- (BOOL)validPhone {
    
    return self.length == 11 && [self hasPrefix:@"1"];
}
// 这个 需要用正则表达式 因为是对象方法 所以就不传 email参数 直接用 self代替

+ (BOOL)validEmail:(NSString *)email {
    
    if (email == nil || email == NULL)
        return false;
    
    return [email validEmail];
}
- (BOOL)validEmail {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    
    return [emailTest evaluateWithObject:self];
}

+ (BOOL)validateCarNo:(NSString *)carNo {
    
    if (carNo == nil || carNo == NULL)
        return false;
    
    return [carNo validateCarNo];
}

- (BOOL)validateCarNo {
    
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    
    return [carTest evaluateWithObject:self];
}

@end

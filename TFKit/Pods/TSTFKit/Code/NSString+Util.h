//
//  NSString+Util.h
//  TFKitDemo
//
//  Created by three stone 王 on 2018/6/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

- (BOOL)isEmpty;
/*手机号验证
 */
- (BOOL)validPhone;
/*邮箱验证
 */
- (BOOL)validEmail;
/*车牌号验证
 */
- (BOOL)validateCarNo;

@end

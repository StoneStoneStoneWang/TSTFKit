//
//  UIImage+ColorCast.h
//  JiuTouZhu
//
//  Created by three stone 王 on 2018/7/24.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Cast)

/*
 通过颜色创建image
 */
+ (UIImage*)createImageWithColor: (UIColor*) color;

/*
 字符串转换为image
 */
+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size;
/*
 view 转换为image
 */
+ (UIImage *)imageForView:(UIView *)view;
@end
